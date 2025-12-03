import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// A class to store all the global constants used in the app.
class Global {
  static const double appHzPadding = 20.0;

  /// Function for haptic feedback
  static void hapticFeedback() {
    if (GetPlatform.isIOS) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.vibrate();
    }
  }
}
