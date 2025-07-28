import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Auth endpoint', (sessionBuilder, endpoints) {
    test('when calling register with valid data then returns success', () async {
      final result = await endpoints.auth.register(
        sessionBuilder,
        'testuser',
        'password123',
        'test@example.com',
        'candidate',
      );
      
      expect(result, isA<Map<String, dynamic>>());
      expect(result['success'], equals(true));
      expect(result['user'], isNotNull);
      expect(result['user']['username'], equals('testuser'));
      expect(result['user']['email'], equals('test@example.com'));
      expect(result['user']['role'], equals('candidate'));
      // Should not include password hash in response
      expect(result['user']['passwordHash'], isNull);
    });

    test('when calling register with short password then returns error', () async {
      final result = await endpoints.auth.register(
        sessionBuilder,
        'testuser',
        '123', // too short
        'test@example.com',
        'candidate',
      );
      
      expect(result, isA<Map<String, dynamic>>());
      expect(result['success'], equals(false));
      expect(result['message'], contains('at least 6 characters'));
    });

    test('when calling register with invalid role then returns error', () async {
      final result = await endpoints.auth.register(
        sessionBuilder,
        'testuser',
        'password123',
        'test@example.com',
        'invalid_role',
      );
      
      expect(result, isA<Map<String, dynamic>>());
      expect(result['success'], equals(false));
      expect(result['message'], contains('Invalid role'));
    });

    test('when calling login with valid credentials then returns success', () async {
      final result = await endpoints.auth.login(
        sessionBuilder,
        'admin',
        'password',
      );
      
      expect(result, isA<Map<String, dynamic>>());
      expect(result['success'], equals(true));
      expect(result['user'], isNotNull);
      expect(result['user']['username'], equals('admin'));
      expect(result['user']['role'], equals('admin'));
      // Should not include password hash in response
      expect(result['user']['passwordHash'], isNull);
    });

    test('when calling login with invalid credentials then returns error', () async {
      final result = await endpoints.auth.login(
        sessionBuilder,
        'admin',
        'wrongpassword',
      );
      
      expect(result, isA<Map<String, dynamic>>());
      expect(result['success'], equals(false));
      expect(result['message'], contains('Invalid username or password'));
    });

    test('when calling getUserById with valid ID then returns user', () async {
      final result = await endpoints.auth.getUserById(sessionBuilder, 1);
      
      expect(result, isA<Map<String, dynamic>>());
      expect(result['success'], equals(true));
      expect(result['user'], isNotNull);
      expect(result['user']['id'], equals(1));
      expect(result['user']['username'], isA<String>());
    });

    test('when calling getUserById with invalid ID then returns error', () async {
      final result = await endpoints.auth.getUserById(sessionBuilder, 999);
      
      expect(result, isA<Map<String, dynamic>>());
      expect(result['success'], equals(false));
      expect(result['message'], equals('User not found'));
    });

    test('when calling getAllUsers then returns user list', () async {
      final users = await endpoints.auth.getAllUsers(sessionBuilder);
      
      expect(users, isA<List>());
      expect(users.isNotEmpty, true);
      expect(users.first['username'], isA<String>());
      expect(users.first['email'], isA<String>());
      expect(users.first['role'], isA<String>());
      // Should not include password hash in response
      expect(users.first['passwordHash'], isNull);
    });
  });
}