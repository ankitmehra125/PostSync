import 'package:get/get.dart';
import 'package:post_sync/pages/post/post_controller.dart';

/// The PostBinding class is responsible for binding the PostController to the PostView.
class PostBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PostController());
  }
}