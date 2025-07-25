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

abstract class Registration implements _i1.SerializableModel {
  Registration._({
    this.id,
    required this.noticeId,
    required this.candidateId,
    required this.status,
    required this.submissionDate,
    this.evaluationDate,
    this.evaluatorNotes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Registration({
    int? id,
    required int noticeId,
    required int candidateId,
    required String status,
    required DateTime submissionDate,
    DateTime? evaluationDate,
    String? evaluatorNotes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _RegistrationImpl;

  factory Registration.fromJson(Map<String, dynamic> jsonSerialization) {
    return Registration(
      id: jsonSerialization['id'] as int?,
      noticeId: jsonSerialization['noticeId'] as int,
      candidateId: jsonSerialization['candidateId'] as int,
      status: jsonSerialization['status'] as String,
      submissionDate: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['submissionDate']),
      evaluationDate: jsonSerialization['evaluationDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['evaluationDate']),
      evaluatorNotes: jsonSerialization['evaluatorNotes'] as String?,
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

  int candidateId;

  String status;

  DateTime submissionDate;

  DateTime? evaluationDate;

  String? evaluatorNotes;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Registration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Registration copyWith({
    int? id,
    int? noticeId,
    int? candidateId,
    String? status,
    DateTime? submissionDate,
    DateTime? evaluationDate,
    String? evaluatorNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'noticeId': noticeId,
      'candidateId': candidateId,
      'status': status,
      'submissionDate': submissionDate.toJson(),
      if (evaluationDate != null) 'evaluationDate': evaluationDate?.toJson(),
      if (evaluatorNotes != null) 'evaluatorNotes': evaluatorNotes,
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

class _RegistrationImpl extends Registration {
  _RegistrationImpl({
    int? id,
    required int noticeId,
    required int candidateId,
    required String status,
    required DateTime submissionDate,
    DateTime? evaluationDate,
    String? evaluatorNotes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          noticeId: noticeId,
          candidateId: candidateId,
          status: status,
          submissionDate: submissionDate,
          evaluationDate: evaluationDate,
          evaluatorNotes: evaluatorNotes,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Registration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Registration copyWith({
    Object? id = _Undefined,
    int? noticeId,
    int? candidateId,
    String? status,
    DateTime? submissionDate,
    Object? evaluationDate = _Undefined,
    Object? evaluatorNotes = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Registration(
      id: id is int? ? id : this.id,
      noticeId: noticeId ?? this.noticeId,
      candidateId: candidateId ?? this.candidateId,
      status: status ?? this.status,
      submissionDate: submissionDate ?? this.submissionDate,
      evaluationDate:
          evaluationDate is DateTime? ? evaluationDate : this.evaluationDate,
      evaluatorNotes:
          evaluatorNotes is String? ? evaluatorNotes : this.evaluatorNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
