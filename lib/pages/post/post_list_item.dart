import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:post_sync/pages/post/post_controller.dart';
import 'package:post_sync/common/common_ui.dart';
import 'package:post_sync/common/app_colors.dart';
import 'package:post_sync/global.dart';

class PostListItem extends StatefulWidget {
  final dynamic item;
  final PostController controller;

  const PostListItem({Key? key, required this.item, required this.controller}) : super(key: key);

  @override
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  late final int id;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    id = widget.item['id'] as int;

    // Ensure controller has remaining entry
    widget.controller.remaining[id] ??= RxInt(widget.controller.randomTimerValue());
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final visibleFraction = info.visibleFraction;
    if (visibleFraction > 0 && !_visible) {
      _visible = true;
      widget.controller.startTimerFor(id);
    } else if (visibleFraction == 0 && _visible) {
      _visible = false;
      widget.controller.stopTimerFor(id);
    }
  }

  @override
  void dispose() {
    widget.controller.stopTimerFor(id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('post-item-$id'),
      onVisibilityChanged: _onVisibilityChanged,
      child: GestureDetector(
        onTap: () {
          Global.hapticFeedback();
          widget.controller.onPostItemClick(widget.item);
        },
        child: Obx(() {
          // Reactive read status
          final isRead = widget.controller.readPosts.contains(id);

          return Container(
            margin: EdgeInsets.symmetric(horizontal: Global.appHzPadding, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: CommonUi.customBoxDecoration(
              color: isRead ? AppColors.colorWhite : AppColors.colorLightYellow,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User ID: ${widget.item['userId'] ?? ""}", style: CommonUi.customTextStyle()),
                      Text("Post ID: ${widget.item['id'] ?? ""}", style: CommonUi.customTextStyle()),
                      Text("Title: ${widget.item['title'] ?? ""}", style: CommonUi.customTextStyle()),
                      Text("Body: ${widget.item['body'] ?? ""}", style: CommonUi.customTextStyle()),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                // Timer column
                Obx(() {
                  final rem = widget.controller.remaining[id]?.value ?? 0;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.timer, size: 20),
                      SizedBox(height: 4),
                      Text("${rem}s", style: CommonUi.customTextStyle()),
                    ],
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
