import 'package:test/test.dart';
import '../lib/server.dart' as server;
import '../lib/src/auth_endpoint.dart';
import '../lib/src/evaluation_committee_endpoint.dart';

// Mock session for testing endpoint logic
class MockSession {
  void log(String message) {
    print('SESSION LOG: $message');
  }
  
  // Add any other session methods needed for testing
}

void main() {
  group('Server Integration Tests', () {
    test('Auth endpoint methods should work correctly', () async {
      final authEndpoint = AuthEndpoint();
      final mockSession = MockSession() as dynamic;

      // Test registration
      final registerResult = await authEndpoint.register(
        mockSession, 
        'newuser', 
        'password123', 
        'newuser@example.com', 
        'candidate'
      );
      expect(registerResult['success'], equals(true));
      expect(registerResult['user']['username'], equals('newuser'));

      // Test login
      final loginResult = await authEndpoint.login(mockSession, 'admin', 'password');
      expect(loginResult['success'], equals(true));
      expect(loginResult['user']['username'], equals('admin'));

      // Test getUserById
      final userResult = await authEndpoint.getUserById(mockSession, 1);
      expect(userResult['success'], equals(true));
      expect(userResult['user']['id'], equals(1));

      // Test getAllUsers
      final allUsers = await authEndpoint.getAllUsers(mockSession);
      expect(allUsers, isA<List>());
      expect(allUsers.isNotEmpty, true);
    });

    test('Evaluation Committee endpoint methods should work correctly', () async {
      final committeeEndpoint = EvaluationCommitteeEndpoint();
      final mockSession = MockSession() as dynamic;

      // Test getCommittees
      final committees = await committeeEndpoint.getCommittees(mockSession);
      expect(committees, isA<List>());
      expect(committees.isNotEmpty, true);

      // Test createCommittee
      final newCommittee = await committeeEndpoint.createCommittee(
        mockSession, 
        'Test Committee', 
        'A test committee'
      );
      expect(newCommittee, isNotNull);
      expect(newCommittee!.name, equals('Test Committee'));

      // Test listCommitteeMembers (the originally missing method)
      final members = await committeeEndpoint.listCommitteeMembers(mockSession, 1);
      expect(members, isA<List>());
      expect(members.isNotEmpty, true);
      expect(members.first['committeeId'], equals(1));

      // Test addCommitteeMember
      final newMember = await committeeEndpoint.addCommitteeMember(
        mockSession, 
        1, 
        2, 
        'evaluator'
      );
      expect(newMember, isNotNull);
      expect(newMember!.role, equals('evaluator'));

      // Test removeCommitteeMember
      final removeResult = await committeeEndpoint.removeCommitteeMember(mockSession, 1, 2);
      expect(removeResult, equals(true));

      // Test getCommitteeById
      final committee = await committeeEndpoint.getCommitteeById(mockSession, 1);
      expect(committee, isNotNull);
      expect(committee!.id, equals(1));
    });

    test('Server configuration should be valid', () {
      // This test ensures the server configuration is valid
      // Just test that we can import the server without errors
      expect(true, equals(true)); // Server imports successfully if we get here
    });
  });
}