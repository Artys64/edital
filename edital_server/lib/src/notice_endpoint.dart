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

  /// Deletes a notice by ID. Returns true if the notice was found and deleted, false otherwise.
  Future<bool> deleteNotice(Session session, int id) async {
    // First find the notice by ID
    final notice = await Notice.db.findById(session, id);
    
    // If notice not found, return false
    if (notice == null) {
      return false;
    }
    
    // Delete the notice and return true to indicate success
    await Notice.db.deleteRow(session, notice);
    return true;
  }
}