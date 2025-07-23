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

/// A notice that can be posted and managed by the server.
abstract class Notice extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Notice._({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });

  factory Notice({
    int? id,
    required String title,
    required String content,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _NoticeImpl;

  factory Notice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notice(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = NoticeTable();

  static const db = NoticeRepository._();

  @override
  int? id;

  /// The title of the notice.
  String title;

  /// The content of the notice.
  String content;

  /// The time when the notice was created.
  DateTime createdAt;

  /// The time when the notice was last updated.
  DateTime? updatedAt;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Notice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notice copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
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
    required String content,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          title: title,
          content: content,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Notice copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return Notice(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class NoticeTable extends _i1.Table {
  NoticeTable({super.tableRelation}) : super(tableName: 'notice') {
    id = _i1.ColumnInt(
      'id',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
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

  late final _i1.ColumnInt id;

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        content,
        createdAt,
        updatedAt,
      ];
}

class NoticeInclude extends _i1.IncludeObject {
  NoticeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Notice.t;
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
  _i1.Table get table => Notice.t;
}

class NoticeRepository {
  const NoticeRepository._();

  Future<List<Notice>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    _i1.Transaction? transaction,
    NoticeInclude? include,
  }) async {
    return session.db.find<Notice>(
      where: where?.call(Notice.t),
      orderBy: orderBy?.call(Notice.t),
      orderByList: orderByList?.call(Notice.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Notice?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    _i1.Transaction? transaction,
    NoticeInclude? include,
  }) async {
    return session.db.findFirstRow<Notice>(
      where: where?.call(Notice.t),
      orderBy: orderBy?.call(Notice.t),
      orderByList: orderByList?.call(Notice.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Notice?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    NoticeInclude? include,
  }) async {
    return session.db.findById<Notice>(
      id,
      transaction: transaction,
      include: include,
    );
  }

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