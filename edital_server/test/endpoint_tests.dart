import 'package:test/test.dart';
import '../lib/src/evaluation_committee_endpoint.dart';
import '../lib/src/auth_endpoint.dart';
import '../lib/src/auth_provider.dart';

// Mock session for testing
class MockSession {
  void log(String message) {
    print('LOG: $message');
  }
}

void main() {
  group('Evaluation Committee Tests', () {
    test('listCommitteeMembers should return committee members', () async {
      final endpoint = EvaluationCommitteeEndpoint();
      final session = MockSession() as dynamic;
      
      final members = await endpoint.listCommitteeMembers(session, 1);
      
      expect(members, isA<List>());
      expect(members.isNotEmpty, true);
      expect(members.first['committeeId'], equals(1));
      expect(members.first['username'], isA<String>());
      expect(members.first['role'], isA<String>());
      expect(members.first['createdAt'], isA<String>());
    });

    test('getCommittees should return list of committees', () async {
      final endpoint = EvaluationCommitteeEndpoint();
      final session = MockSession() as dynamic;
      
      final committees = await endpoint.getCommittees(session);
      
      expect(committees, isA<List>());
      expect(committees.isNotEmpty, true);
      expect(committees.first.name, isA<String>());
      expect(committees.first.createdAt, isA<DateTime>());
    });

    test('createCommittee should return created committee', () async {
      final endpoint = EvaluationCommitteeEndpoint();
      final session = MockSession() as dynamic;
      
      final committee = await endpoint.createCommittee(session, 'Test Committee', 'Test Description');
      
      expect(committee, isNotNull);
      expect(committee!.name, equals('Test Committee'));
      expect(committee.description, equals('Test Description'));
    });

    test('addCommitteeMember should return committee member', () async {
      final endpoint = EvaluationCommitteeEndpoint();
      final session = MockSession() as dynamic;
      
      final member = await endpoint.addCommitteeMember(session, 1, 1, 'evaluator');
      
      expect(member, isNotNull);
      expect(member!.committeeId, equals(1));
      expect(member.userId, equals(1));
      expect(member.role, equals('evaluator'));
    });
  });

  group('Auth Endpoint Tests', () {
    test('register with valid data should return success', () async {
      final endpoint = AuthEndpoint();
      final session = MockSession() as dynamic;
      
      final result = await endpoint.register(session, 'testuser', 'password123', 'test@example.com', 'candidate');
      
      expect(result['success'], equals(true));
      expect(result['user']['username'], equals('testuser'));
      expect(result['user']['role'], equals('candidate'));
    });

    test('register with short password should return error', () async {
      final endpoint = AuthEndpoint();
      final session = MockSession() as dynamic;
      
      final result = await endpoint.register(session, 'testuser', '123', 'test@example.com', 'candidate');
      
      expect(result['success'], equals(false));
      expect(result['message'], contains('at least 6 characters'));
    });

    test('register with invalid role should return error', () async {
      final endpoint = AuthEndpoint();
      final session = MockSession() as dynamic;
      
      final result = await endpoint.register(session, 'testuser', 'password123', 'test@example.com', 'invalid_role');
      
      expect(result['success'], equals(false));
      expect(result['message'], contains('Invalid role'));
    });

    test('login with valid credentials should return success', () async {
      final endpoint = AuthEndpoint();
      final session = MockSession() as dynamic;
      
      final result = await endpoint.login(session, 'admin', 'password');
      
      expect(result['success'], equals(true));
      expect(result['user']['username'], equals('admin'));
    });

    test('login with invalid credentials should return error', () async {
      final endpoint = AuthEndpoint();
      final session = MockSession() as dynamic;
      
      final result = await endpoint.login(session, 'admin', 'wrongpassword');
      
      expect(result['success'], equals(false));
      expect(result['message'], contains('Invalid username or password'));
    });
  });
}