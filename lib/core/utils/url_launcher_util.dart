import 'dart:io';

import 'package:test_today/services/overlay_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'locator.dart';

class UrlLauncherUtil {
  static Future<void> onEmailTap(String email) async {
    // String? encodeQueryParameters(Map<String, String> params) {
    //   return params.entries
    //       .map((MapEntry<String, String> e) =>
    //   '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
    //       .join('&');
    // }
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      // query: encodeQueryParameters(<String, String>{
      //   'subject': 'Example Subject & Symbols are allowed!',
      // }),
    );
    await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
  }

  void onMessageTap(String phoneNumber) async {
    final Uri messageLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    if (await canLaunchUrl(messageLaunchUri)) {
      launchUrl(messageLaunchUri);
    }
  }

  static Future<void> onWhatsappTap(
    String number, {
    String? text,
  }) async {
    var whatsappURlAndroid = "https://api.whatsapp.com/send?phone=$number";
    var whatsappURLIos = "https://wa.me/$number";
    try {
      await launchUrl(
        Uri.parse(Platform.isIOS ? whatsappURLIos : whatsappURlAndroid),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print('exception - $e');
      getIt<OverlayService>().showSnackbar(
        message: 'Whatsapp not installed',
      );
    }
  }

  static Future<void> onCallTap(String phoneNumb) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumb,
    );
    if (await canLaunchUrl(phoneLaunchUri)) {
      launchUrl(phoneLaunchUri);
    }
  }

  static Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
