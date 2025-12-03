import 'dart:async';
import 'dart:math';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Value;
import 'package:post_sync/api/api_provider.dart';
import 'package:post_sync/database/app_database.dart';
import 'package:post_sync/routes/app_routes.dart';

/// The PostController class is responsible for managing the state of the post list,
class PostController extends GetxController {
  var posts = <dynamic>[].obs;
  var isLoading = false.obs;
  var readPosts = <int>{}.obs;

  final ApiProvider apiProvider = ApiProvider();
  final AppDatabase db = AppDatabase();

  /// Map of postId -> remaining seconds (observable)
  final Map<int, RxInt> remaining = {};

  /// Map of postId -> timer instance (each widget may create timers,
  /// but controller has helper functions and persist updates to DB)
  final Map<int, Timer> _timers = {};

  final Random _random = Random();

  @override
  void onInit() {
    super.onInit();
    _loadFromLocalThenSync();
  }

  /// Load from DB first (local), populate controller state, then sync with API
  Future<void> _loadFromLocalThenSync() async {
    isLoading.value = true;

    final local = await db.getAllPosts();

    if (local.isNotEmpty) {
      // populate posts from local DB
      posts.value = local
          .map((e) => {
        "id": e.id,
        "userId": e.userId,
        "title": e.title,
        "body": e.body,
      }).toList();

      /// Load read posts from database
      readPosts.clear();

      for(final e in local){
        if(e.isRead == true){
          readPosts.add(e.id); /// Store read post IDs
        }
      }


      // populate remaining map from DB values
      for (final e in local) {
        final t = e.timerRemaining ?? randomTimerValue();
        remaining[e.id] = RxInt(t);
      }
    }

    // Always perform background sync with API and update DB
    await _fetchPostsFromApiAndPersist();

    isLoading.value = false;
  }

  Future<void> _fetchPostsFromApiAndPersist() async {
    try {
      final data = await apiProvider.getApi("posts"); // ensure no leading slash
      if (data != null && data is List) {
        // Convert API list to Drift companions and initialize timer if needed
        final postList = data.map<PostEntityCompanion>((e) {
          final int id = e['id'] as int;
          final int timerVal = remaining[id]?.value ?? randomTimerValue();
          return PostEntityCompanion(
            id: Value(id),
            userId: Value(e['userId'] as int),
            title: Value(e['title'] as String),
            body: Value(e['body'] as String),
            timerRemaining: Value(timerVal),
          );
        }).toList();

        await db.insertPosts(postList);

        // update controller posts and remaining map after DB write
        posts.value = data;
        for (final e in data) {
          final id = e['id'] as int;
          final int t = await _getTimerFromDbOrInit(id);
          remaining[id] ??= RxInt(t);
        }
      } else {
        // API failed — already loaded local above
      }
    } catch (e) {
      debugPrint("Sync error: $e");
    }
  }

  /// Helper: returns timer from DB or sets a new random timer and persists it
  Future<int> _getTimerFromDbOrInit(int postId) async {
    final record = await db.getPostById(postId);
    if (record != null) {
      return record.timerRemaining ?? _initRandomTimerAndSave(postId);
    } else {
      return _initRandomTimerAndSave(postId);
    }
  }

  int randomTimerValue() {
    // pick between 10, 20, 25 seconds (or any other durations)
    final options = [10, 20, 25];
    return options[_random.nextInt(options.length)];
  }

  Future<int> _initRandomTimerAndSave(int postId) async {
    final val = randomTimerValue();
    await db.insertPosts([
      PostEntityCompanion(
        id: Value(postId),
        timerRemaining: Value(val),
      )
    ]);
    return val;
  }

  /// Called from item widget when it becomes visible
  void startTimerFor(int postId) {
    // if already running do nothing
    if (_timers.containsKey(postId)) return;
    // ensure RxInt exists
    remaining[postId] ??= RxInt(randomTimerValue());
    // tick every second
    _timers[postId] = Timer.periodic(Duration(seconds: 1), (timer) async {
      final curr = remaining[postId]!;

      // increment by 1 each second
      curr.value = curr.value + 1;

      // persist new value in DB
      await _updateTimerInDb(postId, curr.value);
    });

  }

  /// Stop/pause timer for that postId
  void stopTimerFor(int postId) {
    final t = _timers.remove(postId);
    t?.cancel();
  }

  /// Pause all timers (e.g. when navigating to details widely)
  void pauseAllTimers() {
    _timers.keys.toList().forEach((id) => stopTimerFor(id));
  }

  Future<void> _updateTimerInDb(int postId, int remainingSec) async {
    // update timerRemaining using drift update
    try {
      await db.into(db.postEntity).insertOnConflictUpdate(PostEntityCompanion(
        id: Value(postId),
        timerRemaining: Value(remainingSec),
      ));
    } catch (e) {
      debugPrint("DB update timer error: $e");
    }
  }

  /// Mark read and navigate
  void onPostItemClick(dynamic item) async{
    final int id = item['id'] as int;

    await db.markPostAsRead(id);
    readPosts.add(id);
    readPosts.refresh();

    // pause the particular timer before navigation
    stopTimerFor(id);

    // navigate to detail
    Get.toNamed(AppRoutes.routePostDetail, arguments: id);
  }

  bool isPostRead(int id) => readPosts.contains(id);

  /// Should be called on controller dispose
  @override
  void onClose() {
    for (var t in _timers.values) {
      t.cancel();
    }
    super.onClose();
  }
}
