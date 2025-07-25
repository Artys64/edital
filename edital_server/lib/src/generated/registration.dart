/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Registration
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = RegistrationTable();

  static const db = RegistrationRepository._();

  @override
  int? id;

  int noticeId;

  int candidateId;

  String status;

  DateTime submissionDate;

  DateTime? evaluationDate;

  String? evaluatorNotes;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static RegistrationInclude include() {
    return RegistrationInclude._();
  }

  static RegistrationIncludeList includeList({
    _i1.WhereExpressionBuilder<RegistrationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RegistrationTable>? orderByList,
    RegistrationInclude? include,
  }) {
    return RegistrationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Registration.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Registration.t),
      include: include,
    );
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

class RegistrationTable extends _i1.Table<int?> {
  RegistrationTable({super.tableRelation}) : super(tableName: 'registrations') {
    noticeId = _i1.ColumnInt(
      'noticeId',
      this,
    );
    candidateId = _i1.ColumnInt(
      'candidateId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    submissionDate = _i1.ColumnDateTime(
      'submissionDate',
      this,
    );
    evaluationDate = _i1.ColumnDateTime(
      'evaluationDate',
      this,
    );
    evaluatorNotes = _i1.ColumnString(
      'evaluatorNotes',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnInt noticeId;

  late final _i1.ColumnInt candidateId;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime submissionDate;

  late final _i1.ColumnDateTime evaluationDate;

  late final _i1.ColumnString evaluatorNotes;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        noticeId,
        candidateId,
        status,
        submissionDate,
        evaluationDate,
        evaluatorNotes,
        createdAt,
        updatedAt,
      ];
}

class RegistrationInclude extends _i1.IncludeObject {
  RegistrationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Registration.t;
}

class RegistrationIncludeList extends _i1.IncludeList {
  RegistrationIncludeList._({
    _i1.WhereExpressionBuilder<RegistrationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Registration.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Registration.t;
}

class RegistrationRepository {
  const RegistrationRepository._();

  /// Returns a list of [Registration]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Registration>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RegistrationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RegistrationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Registration>(
      where: where?.call(Registration.t),
      orderBy: orderBy?.call(Registration.t),
      orderByList: orderByList?.call(Registration.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Registration] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Registration?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RegistrationTable>? where,
    int? offset,
    _i1.OrderByBuilder<RegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RegistrationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Registration>(
      where: where?.call(Registration.t),
      orderBy: orderBy?.call(Registration.t),
      orderByList: orderByList?.call(Registration.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Registration] by its [id] or null if no such row exists.
  Future<Registration?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Registration>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Registration]s in the list and returns the inserted rows.
  ///
  /// The returned [Registration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Registration>> insert(
    _i1.Session session,
    List<Registration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Registration>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Registration] and returns the inserted row.
  ///
  /// The returned [Registration] will have its `id` field set.
  Future<Registration> insertRow(
    _i1.Session session,
    Registration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Registration>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Registration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Registration>> update(
    _i1.Session session,
    List<Registration> rows, {
    _i1.ColumnSelections<RegistrationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Registration>(
      rows,
      columns: columns?.call(Registration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Registration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Registration> updateRow(
    _i1.Session session,
    Registration row, {
    _i1.ColumnSelections<RegistrationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Registration>(
      row,
      columns: columns?.call(Registration.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Registration]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Registration>> delete(
    _i1.Session session,
    List<Registration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Registration>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Registration].
  Future<Registration> deleteRow(
    _i1.Session session,
    Registration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Registration>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Registration>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RegistrationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Registration>(
      where: where(Registration.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RegistrationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Registration>(
      where: where?.call(Registration.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
