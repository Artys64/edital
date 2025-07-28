import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Evaluation Committee endpoint', (sessionBuilder, endpoints) {
    test('when calling listCommitteeMembers then returns member list', () async {
      // This test validates that the listCommitteeMembers method exists and works
      // This addresses the original error: DatabaseQueryException on listCommitteeMembers
      final committeeId = 1;
      final members = await endpoints.evaluationCommittee.listCommitteeMembers(sessionBuilder, committeeId);
      
      expect(members, isA<List>());
      expect(members.isNotEmpty, true);
      expect(members.first['committeeId'], equals(committeeId));
      expect(members.first['username'], isA<String>());
      expect(members.first['role'], isA<String>());
    });

    test('when calling getCommittees then returns committees list', () async {
      final committees = await endpoints.evaluationCommittee.getCommittees(sessionBuilder);
      
      expect(committees, isA<List>());
      expect(committees.isNotEmpty, true);
      expect(committees.first.name, isA<String>());
      expect(committees.first.createdAt, isA<DateTime>());
    });

    test('when calling createCommittee then returns created committee', () async {
      final committee = await endpoints.evaluationCommittee.createCommittee(
        sessionBuilder,
        'Test Committee',
        'Test Description',
      );
      
      expect(committee, isNotNull);
      expect(committee!.name, equals('Test Committee'));
      expect(committee.description, equals('Test Description'));
      expect(committee.createdAt, isA<DateTime>());
    });

    test('when calling addCommitteeMember then returns committee member', () async {
      final member = await endpoints.evaluationCommittee.addCommitteeMember(
        sessionBuilder,
        1, // committeeId
        1, // userId
        'evaluator',
      );
      
      expect(member, isNotNull);
      expect(member!.committeeId, equals(1));
      expect(member.userId, equals(1));
      expect(member.role, equals('evaluator'));
      expect(member.createdAt, isA<DateTime>());
    });

    test('when calling removeCommitteeMember then returns true', () async {
      final result = await endpoints.evaluationCommittee.removeCommitteeMember(
        sessionBuilder,
        1, // committeeId
        1, // userId
      );
      
      expect(result, equals(true));
    });

    test('when calling getCommitteeById then returns committee', () async {
      final committee = await endpoints.evaluationCommittee.getCommitteeById(sessionBuilder, 1);
      
      expect(committee, isNotNull);
      expect(committee!.id, equals(1));
      expect(committee.name, isA<String>());
      expect(committee.createdAt, isA<DateTime>());
    });
  });
}