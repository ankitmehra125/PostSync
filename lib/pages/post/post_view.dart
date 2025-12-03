import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_sync/common/common_ui.dart';
import 'package:post_sync/common/custom_appbar.dart';
import 'package:post_sync/lang/strings.dart';
import 'package:post_sync/pages/post/post_controller.dart';
import 'package:post_sync/pages/post/post_list_item.dart';

/// The PostView displays a list of posts fetched from the local database...
class PostView extends StatelessWidget {
  PostView({super.key});

  final controller = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.textPosts.tr),
      body: Obx(() {
        if (controller.isLoading.value) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => CommonUi.customShimmer(),
          );
        }
        else if(controller.posts.isEmpty){
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox, size: 80, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(Strings.textNoPost.tr, style: CommonUi.customTextStyle(),textAlign: TextAlign.center,),
                ],
              )
          );
        }
        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final item = controller.posts[index];
            return PostListItem(item: item, controller: controller);
          },
        );
      }),
    );
  }
}
