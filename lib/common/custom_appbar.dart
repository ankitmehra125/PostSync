import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_sync/common/app_colors.dart';
import 'package:post_sync/common/app_fonts.dart';
import 'package:post_sync/common/common_ui.dart';
import 'package:post_sync/common/font_sizes.dart';
import 'package:post_sync/global.dart';

/// A custom app bar widget that supports a back button, title, and title image.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.appBarHeight = 56,
    this.backgroundColor = AppColors.colorPrimary,
    this.showBackButton = false,
    this.title = "",
    this.titleFontSize = AppFontSizes.font16,
    this.titleColor = AppColors.colorWhite,
    this.isCenterTitle = true,
    this.onTapBack,
    this.isLeadingText = false,
    this.onLeadingTap,
  });

  final double appBarHeight;
  final Color backgroundColor;
  final bool showBackButton;
  final String title;
  final double titleFontSize;
  final Color titleColor;
  final bool isCenterTitle;
  final void Function()? onTapBack;
  final bool isLeadingText;
  final void Function()? onLeadingTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      toolbarHeight: appBarHeight,
      iconTheme: IconThemeData(color: AppColors.colorWhite),
      centerTitle: isCenterTitle,
      title: Text(title, style: CommonUi.customTextStyle(
          color: AppColors.colorWhite,
          fontSize: AppFontSizes.font18,
          fontFamily: AppFonts.fontBold
      ),),
      leading: showBackButton ? GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Global.hapticFeedback();
            Get.back();
            onLeadingTap?.call();
          },
          child: Padding(padding: EdgeInsets.only(left: Global.appHzPadding), child: Icon(Icons.arrow_back_ios))
      ) : null,
      titleSpacing: Global.appHzPadding,
      actionsPadding: EdgeInsets.only(right: Global.appHzPadding),
      leadingWidth: 40,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}


