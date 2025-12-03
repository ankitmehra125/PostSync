import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_sync/common/app_colors.dart';
import 'package:post_sync/lang/languages.dart';
import 'package:post_sync/routes/app_pages.dart';
import 'package:post_sync/routes/app_routes.dart';

/// The main function is the entry point of the Flutter application.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.colorBg
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        defaultTransition: Transition.rightToLeft,
        locale: Locale('en', 'US'),
        translations: Languages(),
        initialRoute: AppRoutes.routeSplash,
      ),
    );
  }
}
