import 'package:drift/drift.dart';
import 'package:post_sync/api/api_provider.dart';
import 'package:post_sync/routes/app_routes.dart';
import 'package:get/get.dart' hide Value;
import 'package:post_sync/database/app_database.dart';

/// The controller for managing posts in the application.
class PostController extends GetxController {
  var posts = <dynamic>[].obs;
  var isLoading = false.obs;
  var readPosts = <int>{}.obs;

  final ApiProvider apiProvider = ApiProvider();
  final AppDatabase db = AppDatabase();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  /// Fetch posts from API first, store in local DB, fallback to local DB if offline
  void fetchPosts() async {
    isLoading.value = true;

    final data = await apiProvider.getApi("/posts");

    if (data != null && data is List) {
      // Convert API list to Drift companions
      final postList = data.map<PostEntityCompanion>((e) {
        return PostEntityCompanion(
          id: Value(e['id'] as int),
          userId: Value(e['userId'] as int),
          title: Value(e['title'] as String),
          body: Value(e['body'] as String),
        );
      }).toList();

      // Save into local DB
      await db.insertPosts(postList);
      posts.value = data;
    } else {
      // if API failed then Load from local DB
      final local = await db.getAllPosts();

      posts.value = local
          .map((e) => {
        "id": e.id,
        "userId": e.userId,
        "title": e.title,
        "body": e.body,
      }).toList();
    }
    isLoading.value = false;
  }

  /// Handle post tap
  void onPostItemClick(dynamic item) {
    int id = item['id'] ?? 0;
    readPosts.add(id);
    Get.toNamed(AppRoutes.routePostDetail, arguments: id);
  }

  /// Function to check if post is read or not
  bool isPostRead(int id) => readPosts.contains(id);
}
