import 'package:drift/drift.dart';

/// Post table entity
class PostEntity extends Table {
  IntColumn get id => integer()();
  IntColumn get userId => integer()();
  TextColumn get title => text()();
  TextColumn get body => text()();
  IntColumn get timerRemaining => integer().nullable()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
