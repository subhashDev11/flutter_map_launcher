import 'dart:convert';
import 'dart:io';

class ImageUtility {
  static String? imageTo64(File file) {
    try {
      final bytes = File(file.path).readAsBytesSync();
      String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
      return base64Image;
    } catch (e) {
      return null;
    }
  }
}
