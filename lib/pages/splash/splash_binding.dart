import 'package:get/get.dart';
import 'package:post_sync/pages/splash/splash_controller.dart';

/// A binding class for the Splash page, which initializes the SplashController.
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}