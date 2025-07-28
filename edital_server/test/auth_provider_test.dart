import 'package:test/test.dart';
import '../lib/src/auth_provider.dart';

void main() {
  group('AuthProvider Tests', () {
    test('hashPassword should create consistent hashes', () {
      const password = 'testPassword123';
      const salt = 'testSalt';
      
      final hash1 = AuthProvider.hashPassword(password, salt);
      final hash2 = AuthProvider.hashPassword(password, salt);
      
      expect(hash1, equals(hash2));
      expect(hash1, isNotEmpty);
    });

    test('generateSalt should create different salts', () {
      final salt1 = AuthProvider.generateSalt();
      final salt2 = AuthProvider.generateSalt();
      
      expect(salt1, isNotEmpty);
      expect(salt2, isNotEmpty);
      expect(salt1, isNot(equals(salt2)));
    });

    test('User model serialization works correctly', () {
      final user = User(
        id: 1,
        username: 'testuser',
        passwordHash: 'hashedpassword',
        email: 'test@example.com',
        role: 'admin',
        createdAt: DateTime.parse('2025-01-01T00:00:00Z'),
      );

      final json = user.toJson();
      final deserializedUser = User.fromJson(json);

      expect(deserializedUser.id, equals(user.id));
      expect(deserializedUser.username, equals(user.username));
      expect(deserializedUser.email, equals(user.email));
      expect(deserializedUser.role, equals(user.role));
    });

    test('EvaluationCommittee model serialization works correctly', () {
      final committee = EvaluationCommittee(
        id: 1,
        name: 'Test Committee',
        description: 'A test committee',
        createdAt: DateTime.parse('2025-01-01T00:00:00Z'),
      );

      final json = committee.toJson();
      final deserializedCommittee = EvaluationCommittee.fromJson(json);

      expect(deserializedCommittee.id, equals(committee.id));
      expect(deserializedCommittee.name, equals(committee.name));
      expect(deserializedCommittee.description, equals(committee.description));
    });

    test('CommitteeMember model serialization works correctly', () {
      final member = CommitteeMember(
        id: 1,
        committeeId: 100,
        userId: 200,
        role: 'evaluator',
        createdAt: DateTime.parse('2025-01-01T00:00:00Z'),
      );

      final json = member.toJson();
      final deserializedMember = CommitteeMember.fromJson(json);

      expect(deserializedMember.id, equals(member.id));
      expect(deserializedMember.committeeId, equals(member.committeeId));
      expect(deserializedMember.userId, equals(member.userId));
      expect(deserializedMember.role, equals(member.role));
    });
  });
}