import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class RegistrationEndpoint extends Endpoint {
  Future<Registration> createRegistration(Session session, Registration registration) async {
    registration.createdAt = DateTime.now().toUtc();
    registration.updatedAt = DateTime.now().toUtc();
    registration.submissionDate = DateTime.now().toUtc();
    registration.status = 'PENDING';
    await Registration.db.insert(session, [registration]); // Use .db and pass as a list
    return registration;
  }

  Future<Registration?> getRegistrationById(Session session, int id) async {
    return await Registration.db.findById(session, id); // Use .db
  }

  Future<List<Registration>> listRegistrationsByNotice(Session session, int noticeId) async {
    return await Registration.db.find(
      session,
      where: (t) => t.noticeId.equals(noticeId), // Use camelCase for property names
    );
  }

  Future<List<Registration>> listRegistrationsByCandidate(Session session, int candidateId) async {
    return await Registration.db.find(
      session,
      where: (t) => t.candidateId.equals(candidateId), // Use camelCase for property names
    );
  }

  Future<bool> updateRegistration(Session session, Registration registration) async {
    registration.updatedAt = DateTime.now().toUtc(); // Use camelCase
    var result = await Registration.db.update(session, [registration]); // Use .db and pass as a list
    return result.isNotEmpty; // Check if update was successful
  }

  Future<bool> deleteRegistration(Session session, int id) async {
    var result = await Registration.db.deleteWhere(session, where: (t) => t.id.equals(id)); // Use deleteWhere
    return result.isNotEmpty; // Check if rows were deleted
  }

  Future<bool> evaluateRegistration(Session session, int id, String status, String? notes) async {
    var registration = await getRegistrationById(session, id);
    if (registration != null) {
      registration.status = status;
      registration.evaluatorNotes = notes; // Use camelCase
      registration.evaluationDate = DateTime.now().toUtc(); // Use camelCase
      registration.updatedAt = DateTime.now().toUtc(); // Use camelCase
      var result = await Registration.db.update(session, [registration]); // Use .db and pass as a list
      return result.isNotEmpty; // Check if update was successful
    }
    return false;
  }
}