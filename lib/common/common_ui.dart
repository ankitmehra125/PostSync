import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_sync/common/app_colors.dart';
import 'package:post_sync/common/app_fonts.dart';
import 'package:post_sync/common/font_sizes.dart';
import 'package:post_sync/global.dart';
import 'package:shimmer/shimmer.dart';

/// A utility class that holds common UI elements used throughout the app.
class CommonUi {
  /// A custom text style that can be used throughout the app.
  static TextStyle customTextStyle({
    double fontSize = AppFontSizes.font14,
    Color color = AppColors.colorBlack,
    String fontFamily = AppFonts.fontMedium,
    double? height,
    Color? decorationColor,
    FontWeight? fontWeight,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      decoration: textDecoration,
      decorationColor: decorationColor,
      height: height,
    );
  }

  /// A custom decoration for containers and other widgets with shadow and rounded corners.
  static BoxDecoration customBoxDecoration({
    Color color = AppColors.colorWhite,
    double borderRadius = 10,
    Color shadowColor = Colors.black12,
    double blurRadius = 7,
    double spreadRadius = 0,
    Offset offset = const Offset(0, 0),
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
  }

  /// A custom shimmer widget that can be used as a loading placeholder.
  static Widget customShimmer({double width = double.infinity, double height = 180, double borderRadius = 10.0}) {
    return Shimmer.fromColors(
      baseColor: AppColors.colorShimmerBase,
      highlightColor: AppColors.colorShimmerHighlight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Global.appHzPadding,vertical: 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
