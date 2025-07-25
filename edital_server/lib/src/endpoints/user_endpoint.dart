import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<User> createUser(Session session, User user) async {
    user.createdAt = DateTime.now().toUtc();
    user.updatedAt = DateTime.now().toUtc();

    await User.db.insert(session, [user]);
    return user;
  }

  Future<User?> getUserById(Session session, int id) async {
    return await User.db.findById(session, id);
  }

  Future<User?> getUserByEmail(Session session, String email) async {
    return await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );
  }

  Future<List<User>> listUsers(Session session) async {
    return await User.db.find(session);
  }

  Future<bool> updateUser(Session session, User user) async {
    user.updatedAt = DateTime.now().toUtc();
    var result = await User.db.update(session, [user]);
    return result.isNotEmpty;
  }

  Future<bool> deleteUser(Session session, int id) async {
    var result = await User.db.deleteWhere(session, where: (t) => t.id.equals(id));
    return result.isNotEmpty;
  }
}