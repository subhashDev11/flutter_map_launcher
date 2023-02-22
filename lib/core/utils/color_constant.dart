import 'dart:math';

import 'package:flutter/material.dart';

class ColorConstants {
  static const Color errorShade = Colors.white70;
  static Color secondaryButtonColor = fromHex('#BEBEBE');
  static Color primaryColor = fromHex('#FDB813');
  static Color primaryColorLight100 = fromHex('#FDB813').withOpacity(0.1);
  static Color primaryColorLight = fromHex('#FDB813').withOpacity(0.5);

  //static Color dividerColor = fromHex('#06060624');
  static Color dividerColor2 = fromHex('#06060633');
  static Color genderColor = fromHex('#7879F5');
  static Color textFieldFillColor = Colors.white;
  static Color inputTextBorderColor = const Color.fromRGBO(6, 6, 6, 0.2);
  static Color textSubtitleColor = fromHex('#060606').withOpacity(0.8);
  static Color textTitleColor = fromHex('#2C2C2C');
  static Color textTitle2Color = fromHex('#3A3A3A');
  static Color webGreyColor = fromHex('#F0F0F0');
  static Color white30 = fromHex('#F9F9F9');
  static Color actionTextColor = fromHex('#3BAADF');
  static Color dividerColor = fromHex('#11111133');
  static Color descriptionTextColor = fromHex('#111111B7');
  static Color redLight100 = fromHex('#FFDED4');
  static Color blueLight100 = fromHex('#DAF9D9');
  static Color greenLight = fromHex('#9CCC3C');
  static Color blueLight50 = fromHex('#3BAADF33');
  static Color greyLight700 = Colors.grey.shade700;
  static Color lightGrey = fromHex('#646464');

  ///gradient color
  static Color lg1 = fromHex('#F7559B');
  static Color lg2 = fromHex('#F7B155');
  static Color lg3 = fromHex('#06060624');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color randomOpaqueColor() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }
}
