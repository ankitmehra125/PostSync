import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_sync/common/common_ui.dart';
import 'package:post_sync/common/custom_appbar.dart';
import 'package:post_sync/global.dart';
import 'package:post_sync/lang/strings.dart';
import 'package:post_sync/pages/post_detail/post_detail_controller.dart';

/// The PostDetailView displays the details of a specific post.
class PostDetailView extends StatelessWidget {
  PostDetailView({super.key});

  final controller = Get.find<PostDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.textPostDetail.tr),
      body: Obx(() {
        if (controller.postDetail.isEmpty) {
          return CommonUi.customShimmer();
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Global.appHzPadding, vertical: 10),
          child: Text(controller.postDetail['body'] ?? "",style: CommonUi.customTextStyle()),
        );
      }),
    );
  }
}
