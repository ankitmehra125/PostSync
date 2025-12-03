// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PostEntityTable extends PostEntity
    with TableInfo<$PostEntityTable, PostEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timerRemainingMeta = const VerificationMeta(
    'timerRemaining',
  );
  @override
  late final GeneratedColumn<int> timerRemaining = GeneratedColumn<int>(
    'timer_remaining',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    title,
    body,
    timerRemaining,
    isRead,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'post_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<PostEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('timer_remaining')) {
      context.handle(
        _timerRemainingMeta,
        timerRemaining.isAcceptableOrUnknown(
          data['timer_remaining']!,
          _timerRemainingMeta,
        ),
      );
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      timerRemaining: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timer_remaining'],
      ),
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
    );
  }

  @override
  $PostEntityTable createAlias(String alias) {
    return $PostEntityTable(attachedDatabase, alias);
  }
}

class PostEntityData extends DataClass implements Insertable<PostEntityData> {
  final int id;
  final int userId;
  final String title;
  final String body;
  final int? timerRemaining;
  final bool isRead;
  const PostEntityData({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.timerRemaining,
    required this.isRead,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || timerRemaining != null) {
      map['timer_remaining'] = Variable<int>(timerRemaining);
    }
    map['is_read'] = Variable<bool>(isRead);
    return map;
  }

  PostEntityCompanion toCompanion(bool nullToAbsent) {
    return PostEntityCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      body: Value(body),
      timerRemaining: timerRemaining == null && nullToAbsent
          ? const Value.absent()
          : Value(timerRemaining),
      isRead: Value(isRead),
    );
  }

  factory PostEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostEntityData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      timerRemaining: serializer.fromJson<int?>(json['timerRemaining']),
      isRead: serializer.fromJson<bool>(json['isRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'timerRemaining': serializer.toJson<int?>(timerRemaining),
      'isRead': serializer.toJson<bool>(isRead),
    };
  }

  PostEntityData copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
    Value<int?> timerRemaining = const Value.absent(),
    bool? isRead,
  }) => PostEntityData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    body: body ?? this.body,
    timerRemaining: timerRemaining.present
        ? timerRemaining.value
        : this.timerRemaining,
    isRead: isRead ?? this.isRead,
  );
  PostEntityData copyWithCompanion(PostEntityCompanion data) {
    return PostEntityData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      timerRemaining: data.timerRemaining.present
          ? data.timerRemaining.value
          : this.timerRemaining,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PostEntityData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('timerRemaining: $timerRemaining, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, title, body, timerRemaining, isRead);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostEntityData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.body == this.body &&
          other.timerRemaining == this.timerRemaining &&
          other.isRead == this.isRead);
}

class PostEntityCompanion extends UpdateCompanion<PostEntityData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> body;
  final Value<int?> timerRemaining;
  final Value<bool> isRead;
  const PostEntityCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.timerRemaining = const Value.absent(),
    this.isRead = const Value.absent(),
  });
  PostEntityCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String title,
    required String body,
    this.timerRemaining = const Value.absent(),
    this.isRead = const Value.absent(),
  }) : userId = Value(userId),
       title = Value(title),
       body = Value(body);
  static Insertable<PostEntityData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? body,
    Expression<int>? timerRemaining,
    Expression<bool>? isRead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (timerRemaining != null) 'timer_remaining': timerRemaining,
      if (isRead != null) 'is_read': isRead,
    });
  }

  PostEntityCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? title,
    Value<String>? body,
    Value<int?>? timerRemaining,
    Value<bool>? isRead,
  }) {
    return PostEntityCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      timerRemaining: timerRemaining ?? this.timerRemaining,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (timerRemaining.present) {
      map['timer_remaining'] = Variable<int>(timerRemaining.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostEntityCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('timerRemaining: $timerRemaining, ')
          ..write('isRead: $isRead')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PostEntityTable postEntity = $PostEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [postEntity];
}

typedef $$PostEntityTableCreateCompanionBuilder =
    PostEntityCompanion Function({
      Value<int> id,
      required int userId,
      required String title,
      required String body,
      Value<int?> timerRemaining,
      Value<bool> isRead,
    });
typedef $$PostEntityTableUpdateCompanionBuilder =
    PostEntityCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> title,
      Value<String> body,
      Value<int?> timerRemaining,
      Value<bool> isRead,
    });

class $$PostEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PostEntityTable> {
  $$PostEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timerRemaining => $composableBuilder(
    column: $table.timerRemaining,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PostEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PostEntityTable> {
  $$PostEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timerRemaining => $composableBuilder(
    column: $table.timerRemaining,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PostEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PostEntityTable> {
  $$PostEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<int> get timerRemaining => $composableBuilder(
    column: $table.timerRemaining,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);
}

class $$PostEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PostEntityTable,
          PostEntityData,
          $$PostEntityTableFilterComposer,
          $$PostEntityTableOrderingComposer,
          $$PostEntityTableAnnotationComposer,
          $$PostEntityTableCreateCompanionBuilder,
          $$PostEntityTableUpdateCompanionBuilder,
          (
            PostEntityData,
            BaseReferences<_$AppDatabase, $PostEntityTable, PostEntityData>,
          ),
          PostEntityData,
          PrefetchHooks Function()
        > {
  $$PostEntityTableTableManager(_$AppDatabase db, $PostEntityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PostEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PostEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PostEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<int?> timerRemaining = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
              }) => PostEntityCompanion(
                id: id,
                userId: userId,
                title: title,
                body: body,
                timerRemaining: timerRemaining,
                isRead: isRead,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String title,
                required String body,
                Value<int?> timerRemaining = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
              }) => PostEntityCompanion.insert(
                id: id,
                userId: userId,
                title: title,
                body: body,
                timerRemaining: timerRemaining,
                isRead: isRead,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PostEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PostEntityTable,
      PostEntityData,
      $$PostEntityTableFilterComposer,
      $$PostEntityTableOrderingComposer,
      $$PostEntityTableAnnotationComposer,
      $$PostEntityTableCreateCompanionBuilder,
      $$PostEntityTableUpdateCompanionBuilder,
      (
        PostEntityData,
        BaseReferences<_$AppDatabase, $PostEntityTable, PostEntityData>,
      ),
      PostEntityData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PostEntityTableTableManager get postEntity =>
      $$PostEntityTableTableManager(_db, _db.postEntity);
}
