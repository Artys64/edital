/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class EvaluationCommittee implements _i1.SerializableModel {
  EvaluationCommittee._({
    this.id,
    required this.noticeId,
    required this.evaluatorId,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EvaluationCommittee({
    int? id,
    required int noticeId,
    required int evaluatorId,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EvaluationCommitteeImpl;

  factory EvaluationCommittee.fromJson(Map<String, dynamic> jsonSerialization) {
    return EvaluationCommittee(
      id: jsonSerialization['id'] as int?,
      noticeId: jsonSerialization['noticeId'] as int,
      evaluatorId: jsonSerialization['evaluatorId'] as int,
      role: jsonSerialization['role'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int noticeId;

  int evaluatorId;

  String role;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [EvaluationCommittee]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EvaluationCommittee copyWith({
    int? id,
    int? noticeId,
    int? evaluatorId,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'noticeId': noticeId,
      'evaluatorId': evaluatorId,
      'role': role,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EvaluationCommitteeImpl extends EvaluationCommittee {
  _EvaluationCommitteeImpl({
    int? id,
    required int noticeId,
    required int evaluatorId,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          noticeId: noticeId,
          evaluatorId: evaluatorId,
          role: role,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [EvaluationCommittee]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EvaluationCommittee copyWith({
    Object? id = _Undefined,
    int? noticeId,
    int? evaluatorId,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EvaluationCommittee(
      id: id is int? ? id : this.id,
      noticeId: noticeId ?? this.noticeId,
      evaluatorId: evaluatorId ?? this.evaluatorId,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
