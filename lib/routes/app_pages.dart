import 'package:get/get.dart';
import 'package:post_sync/pages/post/post_binding.dart';
import 'package:post_sync/pages/post/post_view.dart';
import 'package:post_sync/pages/post_detail/post_detail_binding.dart';
import 'package:post_sync/pages/post_detail/post_detail_view.dart';
import 'package:post_sync/pages/splash/splash_binding.dart';
import 'package:post_sync/pages/splash/splash_view.dart';
import 'package:post_sync/routes/app_routes.dart';

/// A class that manages the routes of the application.
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.routeSplash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.routePost,
      page: () => PostView(),
      binding: PostBinding()
    ),
    GetPage(
      name: AppRoutes.routePostDetail,
      page: () => PostDetailView(),
      binding: PostDetailBinding()
    )
  ];
}
