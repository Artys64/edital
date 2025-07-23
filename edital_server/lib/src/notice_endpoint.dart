import 'generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// This endpoint handles notice-related operations.
class NoticeEndpoint extends Endpoint {
  /// Returns all notices.
  Future<List<Notice>> getNotices(Session session) async {
    return await Notice.db.find(session);
  }

  /// Creates a new notice.
  Future<Notice> createNotice(Session session, String title, String content) async {
    final notice = Notice(
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    return await Notice.db.insertRow(session, notice);
  }

  /// Deletes a notice by ID. This method has the type error described in the problem statement.
  Future<bool> deleteNotice(Session session, int id) async {
    return await Notice.db.deleteRow(session, id);
  }
}