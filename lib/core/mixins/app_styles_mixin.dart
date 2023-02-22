import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:test_today/core/app_extensions.dart';
import 'package:test_today/core/core.dart';
import 'package:test_today/services/services.dart';
import 'package:flutter/material.dart';
import '../route/navigation_service.dart';

mixin AppStyleMixin<T extends StatelessWidget> {
  NavigationService getNavigationService() => getIt<NavigationService>();

  GlobalKey<NavigatorState> getNavigatorKey() => getIt<NavigationService>().navigatorKey;

  ThemeData getTheme(BuildContext context) => Theme.of(context);

  TextStyle? getTitleTheme(BuildContext context) => Theme.of(context).textTheme.titleMedium?.copyWith(
        fontFamily: 'Roboto',
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: context.isDarkTheme() ? null : ColorConstants.textTitleColor,
      );

  TextStyle? getSubtitleTheme(BuildContext context) => Theme.of(context).textTheme.titleMedium?.copyWith(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: context.isDarkTheme() ? null : ColorConstants.textSubtitleColor,
      );

  TextStyle? getTitleTheme1(BuildContext context) => Theme.of(context).textTheme.titleMedium?.copyWith(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: context.isDarkTheme() ? null : ColorConstants.textTitle2Color,
        fontWeight: FontWeight.w500,
      );

  TextStyle? getTitle2Theme(BuildContext context) => Theme.of(context).textTheme.bodySmall?.copyWith(
        fontFamily: 'Roboto',
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );

  TextStyle? getSubHeadTitle() => const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontSize: 15,
      );

  TextStyle? getRegularCaptionStyle() => const TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 13,
        height: 1.4,
      );

  TextStyle? getFooterTitleStyle(BuildContext context) => getTitle2Theme(context)?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: context.isDarkTheme() ? null : ColorConstants.textSubtitleColor.withOpacity(0.8),
      );

  bool isLandscape(BuildContext context) => MediaQuery.of(context).orientation == Orientation.landscape;

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double getHeight(BuildContext context) =>
      isLandscape(context) ? getWidth(context) : MediaQuery.of(context).size.height;

  bool isMobile(BuildContext context) {
    TargetPlatform platform = Theme.of(context).platform;
    return (platform == TargetPlatform.iOS) || (platform == TargetPlatform.android);
  }

  Future<bool> onBackPressed({required String title}) async {
    bool back = false;
    await getIt<OverlayService>().showAwesomeDialog(
      onPrimaryTap: () {
        back = true;
      },
      onSecondaryTap: () {
        back = false;
      },
      title: title,
      subTitle: 'Are sure to discard changes?',
      secondaryText: 'No',
      primaryText: 'Yes',
      dialogType: DialogType.question,
    );
    return back;
  }

  String? dateFromCreatedAt(String? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateTimeUtility.getFormattedDateFromMonthlyCreated(dateTime);
  }

  TextStyle? getTextFormWidgetStyle(BuildContext context) => getTitleTheme(context)?.copyWith(
        fontFamily: 'Roboto',
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );

  TextStyle? getFormTitleStyle(BuildContext context) => getTitleTheme(context)?.copyWith(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  Color? getRichTxtSubTitleColor(BuildContext context) {
    return context.isDarkTheme() ? Colors.white70 : Colors.black54;
  }

  Color? getRichTxtTitleColor(BuildContext context) {
    return context.isDarkTheme() ? Colors.white : Colors.black87;
  }

  Color? getInputFillColor(BuildContext context, {VoidCallback? onTap, bool? isReadOnly}) {
    if (isReadOnly ?? false) {
      if (onTap == null) {
        return context.isDarkTheme() ? null : ColorConstants.textFieldFillColor;
      } else {
        return context.isDarkTheme() ? null : Colors.white;
      }
    } else {
      return context.isDarkTheme() ? null : Colors.white;
    }
  }

  Color getDividerColor(BuildContext context) =>
      context.isDarkTheme() ? getTheme(context).dividerColor : ColorConstants.dividerColor;
}
