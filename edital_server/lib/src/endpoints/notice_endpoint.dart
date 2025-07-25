import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class NoticeEndpoint extends Endpoint {
  Future<Notice> createNotice(Session session, Notice notice) async {
    notice.createdAt = DateTime.now().toUtc();
    notice.updatedAt = DateTime.now().toUtc();
    notice.status = 'DRAFT';
    
    // Correct Serverpod syntax:
     // Insert expects a List<Notice>
    await Notice.db.insert(session, [notice]);
    return notice;
  }

  Future<Notice?> getNoticeById(Session session, int id) async {
    return await Notice.db.findById(session, id);
  }

  Future<List<Notice>> listNotices(Session session) async {
    return await Notice.db.find(session);
  }

  Future<bool> updateNotice(Session session, Notice notice) async {
    notice.updatedAt = DateTime.now().toUtc();
    var result = await Notice.db.update(session, [notice]);
    return result.isNotEmpty;
  }

   Future<bool> deleteNotice(Session session, int id) async {
    var result = await Notice.db.deleteWhere(session, where: (t) => t.id.equals(id));
    return result.isNotEmpty;
  }

 Future<bool> publishNotice(Session session, int id) async {
    var notice = await getNoticeById(session, id);
    if (notice != null) {
      notice.status = 'PUBLISHED';
      notice.updatedAt = DateTime.now().toUtc();
      var result = await Notice.db.update(session, [notice]);
      return result.isNotEmpty;
    }
    return false;
  }

   Future<bool> closeNotice(Session session, int id) async {
    var notice = await getNoticeById(session, id);
    if (notice != null) {
      notice.status = 'CLOSED';
      notice.updatedAt = DateTime.now().toUtc();
      var result = await Notice.db.update(session, [notice]);
      return result.isNotEmpty;
    }
    return false;
  }
}