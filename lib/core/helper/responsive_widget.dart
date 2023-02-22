import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;
  const ResponsiveBuilder({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.web,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;
  static bool isTab(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;
  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
  static bool isMobileButWeb(BuildContext context) =>
      isMobile(context) && kIsWeb;
  static bool isTabButWeb(BuildContext context) => isTab(context) && kIsWeb;
  static bool isOnlyWeb(BuildContext context) => kIsWeb;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth >= 1100) {
        return web;
      } else if (constraint.maxWidth >= 650) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
