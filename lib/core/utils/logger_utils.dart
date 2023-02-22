import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger appLogger = Logger();

  static e(String e) {
    if (kDebugMode) {
      appLogger.e(e);
    }
  }

  static d(String d) {
    if (kDebugMode) {
      appLogger.d(d);
    }
  }

  static i(String i) {
    if (kDebugMode) {
      appLogger.i(i);
    }
  }
}
