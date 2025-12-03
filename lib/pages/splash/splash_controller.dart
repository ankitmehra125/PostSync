import 'package:get/get.dart';
import 'package:post_sync/routes/app_routes.dart';

/// A controller for the Splash page, extending GetXController.
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextPage();
  }

  /// Function to navigate to the appropriate next screen
  void navigateToNextPage() {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offNamed(AppRoutes.routePost);
    });
  }
}


