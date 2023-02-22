import 'dart:math';
import 'package:flutter/material.dart';

class ColorConstants {
  static Color randomOpaqueColor() {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }

  static Color menu1BG = fromHex('#fde9ea');
  static Color menu1IconBG = fromHex('#fac2c0');
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color menuButton = fromHex('#fb6b22');
}
