import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'post_entity.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PostEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from == 1) {
        await m.addColumn(postEntity, postEntity.isRead);
      }
    },
  );

  /// Fetch all posts
  Future<List<PostEntityData>> getAllPosts() => select(postEntity).get();

  /// Insert multiple posts
  Future<void> insertPosts(List<PostEntityCompanion> postList) async {
    await batch((batch) {
      batch.insertAll(postEntity, postList, mode: InsertMode.insertOrReplace);
    });
  }

  /// Fetch single post by id
  Future<PostEntityData?> getPostById(int id) {
    return (select(postEntity)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Mark post as read
  Future<void> markPostAsRead(int id) async {
    await (update(postEntity)..where((tbl) => tbl.id.equals(id)))
        .write(PostEntityCompanion(isRead: Value(true)));
  }

  /// Check if post is read
  Future<bool> isPostRead(int id) async {
    final result = await (select(postEntity)..where((t) => t.id.equals(id))).getSingleOrNull();
    return result?.isRead ?? false;
  }

}

/// Open connection for Drift database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
