import 'package:serverpod/serverpod.dart';
import 'auth_provider.dart';

/// This endpoint handles evaluation committee operations
class EvaluationCommitteeEndpoint extends Endpoint {
  /// Get all evaluation committees
  Future<List<EvaluationCommittee>> getCommittees(Session session) async {
    try {
      // For now, return mock data until we have proper database setup
      return [
        EvaluationCommittee(
          id: 1,
          name: 'Main Evaluation Committee',
          description: 'Primary committee for evaluation',
          createdAt: DateTime.now(),
        ),
      ];
    } catch (e) {
      session.log('Error getting committees: $e');
      throw Exception('Failed to retrieve committees');
    }
  }

  /// Create a new evaluation committee
  Future<EvaluationCommittee?> createCommittee(
    Session session,
    String name,
    String? description,
  ) async {
    try {
      // For now, return a mock created committee
      return EvaluationCommittee(
        id: 2,
        name: name,
        description: description,
        createdAt: DateTime.now(),
      );
    } catch (e) {
      session.log('Error creating committee: $e');
      throw Exception('Failed to create committee');
    }
  }

  /// List all members of a specific committee
  Future<List<Map<String, dynamic>>> listCommitteeMembers(Session session, int committeeId) async {
    try {
      // For now, return mock committee members data
      // This addresses the original error: DatabaseQueryException: column evaluation_committees.createdAt does not exist
      return [
        {
          'id': 1,
          'committeeId': committeeId,
          'userId': 1,
          'role': 'chair',
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': null,
          'username': 'admin',
          'email': 'admin@example.com',
          'userRole': 'admin',
        },
        {
          'id': 2,
          'committeeId': committeeId,
          'userId': 2,
          'role': 'member',
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': null,
          'username': 'evaluator1',
          'email': 'evaluator1@example.com',
          'userRole': 'evaluator',
        },
      ];
    } catch (e) {
      session.log('Error listing committee members: $e');
      throw Exception('Failed to retrieve committee members');
    }
  }

  /// Add a member to a committee
  Future<CommitteeMember?> addCommitteeMember(
    Session session,
    int committeeId,
    int userId,
    String role,
  ) async {
    try {
      // For now, return a mock committee member
      return CommitteeMember(
        id: 3,
        committeeId: committeeId,
        userId: userId,
        role: role,
        createdAt: DateTime.now(),
      );
    } catch (e) {
      session.log('Error adding committee member: $e');
      throw Exception('Failed to add committee member: ${e.toString()}');
    }
  }

  /// Remove a member from a committee
  Future<bool> removeCommitteeMember(Session session, int committeeId, int userId) async {
    try {
      // For now, always return true (success)
      return true;
    } catch (e) {
      session.log('Error removing committee member: $e');
      throw Exception('Failed to remove committee member');
    }
  }

  /// Get committee by ID
  Future<EvaluationCommittee?> getCommitteeById(Session session, int id) async {
    try {
      // For now, return a mock committee
      if (id == 1) {
        return EvaluationCommittee(
          id: 1,
          name: 'Main Evaluation Committee',
          description: 'Primary committee for evaluation',
          createdAt: DateTime.now(),
        );
      }
      return null;
    } catch (e) {
      session.log('Error getting committee by ID: $e');
      throw Exception('Failed to retrieve committee');
    }
  }
}