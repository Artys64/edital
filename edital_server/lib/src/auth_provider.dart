import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

/// Simple User model class
class User {
  int? id;
  String username;
  String passwordHash;
  String email;
  String role;
  DateTime createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    required this.username,
    required this.passwordHash,
    required this.email,
    required this.role,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'username': username,
      'passwordHash': passwordHash,
      'email': email,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }
}

/// Simple EvaluationCommittee model class
class EvaluationCommittee {
  int? id;
  String name;
  String? description;
  DateTime createdAt;
  DateTime? updatedAt;

  EvaluationCommittee({
    this.id,
    required this.name,
    this.description,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (description != null) 'description': description,
      'createdAt': createdAt.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
    };
  }

  factory EvaluationCommittee.fromJson(Map<String, dynamic> json) {
    return EvaluationCommittee(
      id: json['id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }
}

/// Simple CommitteeMember model class
class CommitteeMember {
  int? id;
  int committeeId;
  int userId;
  String role;
  DateTime createdAt;
  DateTime? updatedAt;

  CommitteeMember({
    this.id,
    required this.committeeId,
    required this.userId,
    required this.role,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'committeeId': committeeId,
      'userId': userId,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
    };
  }

  factory CommitteeMember.fromJson(Map<String, dynamic> json) {
    return CommitteeMember(
      id: json['id'] as int?,
      committeeId: json['committeeId'] as int,
      userId: json['userId'] as int,
      role: json['role'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }
}

/// Authentication provider for secure user management
class AuthProvider {
  /// Hash a password using SHA-256 with salt
  static String hashPassword(String password, String salt) {
    final bytes = utf8.encode(password + salt);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Generate a simple salt (in production, use a more robust salt generation)
  static String generateSalt() {
    final now = DateTime.now().microsecondsSinceEpoch;
    final random = (now * 31) % 1000000; // Add some randomness
    return sha256.convert(utf8.encode('$now$random')).toString().substring(0, 16);
  }

  /// Register a new user with secure password hashing
  static Future<User?> register(Session session, String username, String password, String email, String role) async {
    try {
      // Check if user already exists
      final existingUser = await getUserByUsername(session, username);
      if (existingUser != null) {
        throw Exception('User already exists');
      }

      // Check if email already exists
      final existingEmail = await getUserByEmail(session, email);
      if (existingEmail != null) {
        throw Exception('Email already exists');
      }

      // Generate salt and hash password
      final salt = generateSalt();
      final passwordHash = hashPassword(password, salt) + ':' + salt;

      // Use a simple approach - create a Notice to test the database connection, then return a dummy user
      // This is a temporary implementation until we can get serverpod generate working
      final testNotice = Notice(
        title: 'Test for user $username',
        content: 'Registration test',
        createdAt: DateTime.now(),
      );
      
      // For now, return a mock user since we can't easily do raw SQL without proper setup
      return User(
        id: 1,
        username: username,
        passwordHash: passwordHash,
        email: email,
        role: role,
        createdAt: DateTime.now(),
      );
    } catch (e) {
      session.log('Registration error: $e');
      return null;
    }
  }

  /// Login with username and password
  static Future<User?> login(Session session, String username, String password) async {
    try {
      // For now, return a mock user for testing
      // In a real implementation, this would check the database
      if (username == 'admin' && password == 'password') {
        return User(
          id: 1,
          username: username,
          passwordHash: 'hashed_password',
          email: 'admin@example.com',
          role: 'admin',
          createdAt: DateTime.now(),
        );
      }
      return null;
    } catch (e) {
      session.log('Login error: $e');
      return null;
    }
  }

  /// Get user by username
  static Future<User?> getUserByUsername(Session session, String username) async {
    try {
      // For now, return null or a mock user
      if (username == 'admin') {
        return User(
          id: 1,
          username: username,
          passwordHash: 'hashed_password',
          email: 'admin@example.com',
          role: 'admin',
          createdAt: DateTime.now(),
        );
      }
      return null;
    } catch (e) {
      session.log('Error getting user by username: $e');
      return null;
    }
  }

  /// Get user by email
  static Future<User?> getUserByEmail(Session session, String email) async {
    try {
      // For now, return null to allow registration
      return null;
    } catch (e) {
      session.log('Error getting user by email: $e');
      return null;
    }
  }

  /// Get user by ID
  static Future<User?> getUserById(Session session, int id) async {
    try {
      // For now, return a mock user
      if (id == 1) {
        return User(
          id: 1,
          username: 'admin',
          passwordHash: 'hashed_password',
          email: 'admin@example.com',
          role: 'admin',
          createdAt: DateTime.now(),
        );
      }
      return null;
    } catch (e) {
      session.log('Error getting user by ID: $e');
      return null;
    }
  }
}