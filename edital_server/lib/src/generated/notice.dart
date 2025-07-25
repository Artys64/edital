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

abstract class Notice implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Notice._({
    this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdById,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notice({
    int? id,
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
    required int createdById,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _NoticeImpl;

  factory Notice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notice(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      startDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      status: jsonSerialization['status'] as String,
      createdById: jsonSerialization['createdById'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = NoticeTable();

  static const db = NoticeRepository._();

  @override
  int? id;

  String title;

  String description;

  DateTime startDate;

  DateTime endDate;

  String status;

  int createdById;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Notice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notice copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    int? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'status': status,
      'createdById': createdById,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'status': status,
      'createdById': createdById,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static NoticeInclude include() {
    return NoticeInclude._();
  }

  static NoticeIncludeList includeList({
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    NoticeInclude? include,
  }) {
    return NoticeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notice.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Notice.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NoticeImpl extends Notice {
  _NoticeImpl({
    int? id,
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
    required int createdById,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          title: title,
          description: description,
          startDate: startDate,
          endDate: endDate,
          status: status,
          createdById: createdById,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Notice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notice copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    int? createdById,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Notice(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class NoticeTable extends _i1.Table<int?> {
  NoticeTable({super.tableRelation}) : super(tableName: 'notices') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    startDate = _i1.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _i1.ColumnDateTime(
      'endDate',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
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

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  late final _i1.ColumnString status;

  late final _i1.ColumnInt createdById;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        description,
        startDate,
        endDate,
        status,
        createdById,
        createdAt,
        updatedAt,
      ];
}

class NoticeInclude extends _i1.IncludeObject {
  NoticeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Notice.t;
}

class NoticeIncludeList extends _i1.IncludeList {
  NoticeIncludeList._({
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Notice.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Notice.t;
}

class NoticeRepository {
  const NoticeRepository._();

  /// Returns a list of [Notice]s matching the given query parameters.
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
  Future<List<Notice>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Notice>(
      where: where?.call(Notice.t),
      orderBy: orderBy?.call(Notice.t),
      orderByList: orderByList?.call(Notice.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Notice] matching the given query parameters.
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
  Future<Notice?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Notice>(
      where: where?.call(Notice.t),
      orderBy: orderBy?.call(Notice.t),
      orderByList: orderByList?.call(Notice.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Notice] by its [id] or null if no such row exists.
  Future<Notice?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Notice>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Notice]s in the list and returns the inserted rows.
  ///
  /// The returned [Notice]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Notice>> insert(
    _i1.Session session,
    List<Notice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Notice>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Notice] and returns the inserted row.
  ///
  /// The returned [Notice] will have its `id` field set.
  Future<Notice> insertRow(
    _i1.Session session,
    Notice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Notice>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Notice]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Notice>> update(
    _i1.Session session,
    List<Notice> rows, {
    _i1.ColumnSelections<NoticeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Notice>(
      rows,
      columns: columns?.call(Notice.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Notice]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Notice> updateRow(
    _i1.Session session,
    Notice row, {
    _i1.ColumnSelections<NoticeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Notice>(
      row,
      columns: columns?.call(Notice.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Notice]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Notice>> delete(
    _i1.Session session,
    List<Notice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Notice>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Notice].
  Future<Notice> deleteRow(
    _i1.Session session,
    Notice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Notice>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Notice>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NoticeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Notice>(
      where: where(Notice.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Notice>(
      where: where?.call(Notice.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
