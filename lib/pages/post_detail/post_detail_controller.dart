import 'package:get/get.dart';
import 'package:post_sync/database/app_database.dart';

/// The PostDetailController class manages the state and logic for the PostDetailView.
class PostDetailController extends GetxController {
  late int postId; // store id
  var postDetail = {}.obs; // store post data

  final AppDatabase db = AppDatabase();

  @override
  void onInit() {
    super.onInit();
    getPostId();
    fetchPostDetail();
  }

  /// Function to get post ID from arguments
  void getPostId() {
    postId = Get.arguments as int;
  }

  /// Fetch single post from local DB
  void fetchPostDetail() async {
    final data = await db.getPostById(postId);
    if (data != null) {
      postDetail.value = data.toJson();
    }
  }
}
