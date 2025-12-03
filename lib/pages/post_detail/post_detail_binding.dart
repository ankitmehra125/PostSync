import 'package:get/get.dart';
import 'package:post_sync/pages/post_detail/post_detail_controller.dart';

/// A binding class that connects dependencies for the PostDetail module.
class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostDetailController());
  }
}