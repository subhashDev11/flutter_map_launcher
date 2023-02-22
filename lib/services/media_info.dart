// import 'dart:async';
// import 'dart:io';
// import 'dart:ui' as ui;
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/services.dart';
// import 'package:mime/mime.dart';
//
// /// Media information & basic thumbnail creation methods.
// class MediaInfo {
//   /// Initializes the plugin and starts listening for potential platform events.
//   factory MediaInfo() {
//     return _instance ??= MediaInfo.private(
//       const MethodChannel('asia.ivity.flutter/media_info'),
//     );
//   }
//
//   /// This constructor is only used for testing and shouldn't be accessed by
//   /// users of the plugin. It may break or change at any time.
//   @visibleForTesting
//   MediaInfo.private(this._methodChannel);
//
//   static MediaInfo? _instance;
//
//   final MethodChannel _methodChannel;
//
//   /// Utilizes platform methods (which may include a combination of HW and SW
//   /// decoders) to analyze the media file at a given path.
//   ///
//   /// This method will return a standard [FlutterError] if the decoding failed.
//   ///
//   /// Valid media files will generate a dictionary with relevant fields set.
//   ///
//   /// Images are decoded in Dart, while Audio & Video files are processed on the platform itself.
//   ///
//   /// The returned map contains the following fields, depending on the content parsed.
//   ///
//   /// | Images   | Videos     | Audio      |
//   /// |----------|------------|------------|
//   /// | mimeType | mimeType   | mimeType   |
//   /// | width    | width      |            |
//   /// | height   | height     |            |
//   /// |          | frameRate  |            |
//   /// |          | durationMs | durationMs |
//   /// |          | numTracks  |            |
//   /// |          |            | bitrate    |
//   Future<Map<String, dynamic>> getMediaInfo(String path) async {
//     final RandomAccessFile file = File(path).openSync();
//     final Uint8List headerBytes = file.readSync(defaultMagicNumbersMaxLength);
//     final String? mimeType = lookupMimeType(path, headerBytes: headerBytes);
//
//     if (mimeType?.startsWith('image') == true) {
//       Completer<ui.Image> completer = Completer<ui.Image>();
//
//       final stream = FileImage(File(path)).resolve(const ImageConfiguration());
//
//       final ImageStreamListener listener =
//           ImageStreamListener((ImageInfo image, __) {
//         if (!completer.isCompleted) {
//           completer.complete(image.image);
//         }
//       });
//
//       stream.addListener(listener);
//
//       final image = await completer.future.whenComplete(
//         () => stream.removeListener(listener),
//       );
//
//       return {
//         'width': image.width,
//         'height': image.height,
//         'mimeType': mimeType,
//       };
//     }
//
//     return (await _methodChannel.invokeMapMethod<String, dynamic>(
//       'getMediaInfo',
//       path,
//     ))!;
//   }
// }
