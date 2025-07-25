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

abstract class EvaluationCommittee
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = EvaluationCommitteeTable();

  static const db = EvaluationCommitteeRepository._();

  @override
  int? id;

  int noticeId;

  int evaluatorId;

  String role;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'noticeId': noticeId,
      'evaluatorId': evaluatorId,
      'role': role,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static EvaluationCommitteeInclude include() {
    return EvaluationCommitteeInclude._();
  }

  static EvaluationCommitteeIncludeList includeList({
    _i1.WhereExpressionBuilder<EvaluationCommitteeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EvaluationCommitteeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EvaluationCommitteeTable>? orderByList,
    EvaluationCommitteeInclude? include,
  }) {
    return EvaluationCommitteeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EvaluationCommittee.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EvaluationCommittee.t),
      include: include,
    );
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

class EvaluationCommitteeTable extends _i1.Table<int?> {
  EvaluationCommitteeTable({super.tableRelation})
      : super(tableName: 'evaluation_committees') {
    noticeId = _i1.ColumnInt(
      'noticeId',
      this,
    );
    evaluatorId = _i1.ColumnInt(
      'evaluatorId',
      this,
    );
    role = _i1.ColumnString(
      'role',
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

  late final _i1.ColumnInt evaluatorId;

  late final _i1.ColumnString role;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        noticeId,
        evaluatorId,
        role,
        createdAt,
        updatedAt,
      ];
}

class EvaluationCommitteeInclude extends _i1.IncludeObject {
  EvaluationCommitteeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EvaluationCommittee.t;
}

class EvaluationCommitteeIncludeList extends _i1.IncludeList {
  EvaluationCommitteeIncludeList._({
    _i1.WhereExpressionBuilder<EvaluationCommitteeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EvaluationCommittee.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EvaluationCommittee.t;
}

class EvaluationCommitteeRepository {
  const EvaluationCommitteeRepository._();

  /// Returns a list of [EvaluationCommittee]s matching the given query parameters.
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
  Future<List<EvaluationCommittee>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EvaluationCommitteeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EvaluationCommitteeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EvaluationCommitteeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EvaluationCommittee>(
      where: where?.call(EvaluationCommittee.t),
      orderBy: orderBy?.call(EvaluationCommittee.t),
      orderByList: orderByList?.call(EvaluationCommittee.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [EvaluationCommittee] matching the given query parameters.
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
  Future<EvaluationCommittee?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EvaluationCommitteeTable>? where,
    int? offset,
    _i1.OrderByBuilder<EvaluationCommitteeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EvaluationCommitteeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<EvaluationCommittee>(
      where: where?.call(EvaluationCommittee.t),
      orderBy: orderBy?.call(EvaluationCommittee.t),
      orderByList: orderByList?.call(EvaluationCommittee.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [EvaluationCommittee] by its [id] or null if no such row exists.
  Future<EvaluationCommittee?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<EvaluationCommittee>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [EvaluationCommittee]s in the list and returns the inserted rows.
  ///
  /// The returned [EvaluationCommittee]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EvaluationCommittee>> insert(
    _i1.Session session,
    List<EvaluationCommittee> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EvaluationCommittee>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EvaluationCommittee] and returns the inserted row.
  ///
  /// The returned [EvaluationCommittee] will have its `id` field set.
  Future<EvaluationCommittee> insertRow(
    _i1.Session session,
    EvaluationCommittee row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EvaluationCommittee>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EvaluationCommittee]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EvaluationCommittee>> update(
    _i1.Session session,
    List<EvaluationCommittee> rows, {
    _i1.ColumnSelections<EvaluationCommitteeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EvaluationCommittee>(
      rows,
      columns: columns?.call(EvaluationCommittee.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EvaluationCommittee]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EvaluationCommittee> updateRow(
    _i1.Session session,
    EvaluationCommittee row, {
    _i1.ColumnSelections<EvaluationCommitteeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EvaluationCommittee>(
      row,
      columns: columns?.call(EvaluationCommittee.t),
      transaction: transaction,
    );
  }

  /// Deletes all [EvaluationCommittee]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EvaluationCommittee>> delete(
    _i1.Session session,
    List<EvaluationCommittee> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EvaluationCommittee>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EvaluationCommittee].
  Future<EvaluationCommittee> deleteRow(
    _i1.Session session,
    EvaluationCommittee row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EvaluationCommittee>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EvaluationCommittee>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EvaluationCommitteeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EvaluationCommittee>(
      where: where(EvaluationCommittee.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EvaluationCommitteeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EvaluationCommittee>(
      where: where?.call(EvaluationCommittee.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
