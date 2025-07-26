import 'package:serverpod/serverpod.dart';
import 'auth_provider.dart';

/// This endpoint handles authentication operations
class AuthEndpoint extends Endpoint {
  /// Register a new user
  Future<Map<String, dynamic>> register(
    Session session,
    String username,
    String password,
    String email,
    String role,
  ) async {
    try {
      // Validate input
      if (username.trim().isEmpty || password.trim().isEmpty || email.trim().isEmpty) {
        return {
          'success': false,
          'message': 'Please provide all required fields',
        };
      }

      if (password.length < 6) {
        return {
          'success': false,
          'message': 'Password must be at least 6 characters long',
        };
      }

      // Validate role
      final validRoles = ['admin', 'candidate', 'evaluator'];
      if (!validRoles.contains(role)) {
        return {
          'success': false,
          'message': 'Invalid role. Must be one of: ${validRoles.join(', ')}',
        };
      }

      final user = await AuthProvider.register(session, username, password, email, role);
      
      if (user != null) {
        // Return user data without password hash
        return {
          'success': true,
          'message': 'User registered successfully',
          'user': {
            'id': user.id,
            'username': user.username,
            'email': user.email,
            'role': user.role,
            'createdAt': user.createdAt.toIso8601String(),
          },
        };
      } else {
        return {
          'success': false,
          'message': 'Registration failed. User may already exist.',
        };
      }
    } catch (e) {
      session.log('Registration endpoint error: $e');
      return {
        'success': false,
        'message': 'Registration failed due to a server error',
      };
    }
  }

  /// Login user
  Future<Map<String, dynamic>> login(
    Session session,
    String username,
    String password,
  ) async {
    try {
      // Validate input
      if (username.trim().isEmpty || password.trim().isEmpty) {
        return {
          'success': false,
          'message': 'Please provide username and password',
        };
      }

      final user = await AuthProvider.login(session, username, password);
      
      if (user != null) {
        // Return user data without password hash
        return {
          'success': true,
          'message': 'Login successful',
          'user': {
            'id': user.id,
            'username': user.username,
            'email': user.email,
            'role': user.role,
            'createdAt': user.createdAt.toIso8601String(),
          },
        };
      } else {
        return {
          'success': false,
          'message': 'Invalid username or password',
        };
      }
    } catch (e) {
      session.log('Login endpoint error: $e');
      return {
        'success': false,
        'message': 'Login failed due to a server error',
      };
    }
  }

  /// Get user by ID
  Future<Map<String, dynamic>> getUserById(Session session, int userId) async {
    try {
      final user = await AuthProvider.getUserById(session, userId);
      
      if (user != null) {
        return {
          'success': true,
          'user': {
            'id': user.id,
            'username': user.username,
            'email': user.email,
            'role': user.role,
            'createdAt': user.createdAt.toIso8601String(),
          },
        };
      } else {
        return {
          'success': false,
          'message': 'User not found',
        };
      }
    } catch (e) {
      session.log('Get user endpoint error: $e');
      return {
        'success': false,
        'message': 'Failed to retrieve user',
      };
    }
  }

  /// Get all users (admin only)
  Future<List<Map<String, dynamic>>> getAllUsers(Session session) async {
    try {
      // For now, return mock users
      return [
        {
          'id': 1,
          'username': 'admin',
          'email': 'admin@example.com',
          'role': 'admin',
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': null,
        },
        {
          'id': 2,
          'username': 'candidate1',
          'email': 'candidate1@example.com',
          'role': 'candidate',
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': null,
        },
      ];
    } catch (e) {
      session.log('Get all users error: $e');
      throw Exception('Failed to retrieve users');
    }
  }
}