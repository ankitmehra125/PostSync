import 'package:get/get.dart';
import 'package:post_sync/lang/strings.dart';

/// This class is used to store all the translations used in the app
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          Strings.textAppName: "PostSync",

          /// Post Page
          Strings.textPosts: "Posts",
          Strings.textNoPost: "No posts available. \nPlease connect to server",

          /// Post Detail Page
          Strings.textPostDetail: "Post Detail",
        },
      };
}
