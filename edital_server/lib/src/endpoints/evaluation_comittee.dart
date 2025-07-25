import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class EvaluationCommitteeEndpoint extends Endpoint {
  Future<EvaluationCommittee> createCommittee(Session session, EvaluationCommittee committee) async {
    committee.createdAt = DateTime.now().toUtc();
    committee.updatedAt = DateTime.now().toUtc();
    await EvaluationCommittee.db.insert(session, [committee]);
    return committee;
  }

  Future<List<EvaluationCommittee>> getCommitteeByNotice(Session session, int noticeId) async {
    return await EvaluationCommittee.db.find(
      session,
      where: (t) => t.noticeId.equals(noticeId),
    );
  }

  Future<List<EvaluationCommittee>> listCommitteeMembers(Session session, int noticeId) async {
    return await EvaluationCommittee.db.find(
      session,
      where: (t) => t.noticeId.equals(noticeId),
    );
  }

  Future<bool> updateCommittee(Session session, EvaluationCommittee committee) async {
    committee.updatedAt = DateTime.now().toUtc();
    var result = await EvaluationCommittee.db.update(session, [committee]);
    return result.isNotEmpty;
  }

  Future<bool> deleteCommittee(Session session, int id) async {
    var result = await EvaluationCommittee.db.deleteWhere(session, where: (t) => t.id.equals(id));
    return result.isNotEmpty;
  }

  Future<EvaluationCommittee> addMember(Session session, int noticeId, int evaluatorId, String role) async {
    var committee = EvaluationCommittee(noticeId: noticeId, evaluatorId: evaluatorId, role: role, createdAt: DateTime.now().toUtc(), updatedAt: DateTime.now().toUtc());

    await EvaluationCommittee.db.insert(session, [committee]);
    return committee;
  }
  Future<bool> removeMember(Session session, int noticeId, int evaluatorId) async {
  var result = await EvaluationCommittee.db.deleteWhere(
    session,
    where: (t) => t.noticeId.equals(noticeId) & t.evaluatorId.equals(evaluatorId),
  );
    return result.isNotEmpty; // Return true if rows were deleted
    }
}

  
