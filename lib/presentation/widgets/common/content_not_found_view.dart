import 'package:test_today/core/mixins/app_styles_mixin.dart';
import 'package:test_today/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

double getHorizontalSize(double value) => value;

double getVerticalSize(double value) => value;

double getFontSize(double value) => value;

class NoContentFound extends StatelessWidget with AppStyleMixin {
  const NoContentFound({
    Key? key,
    this.center,
    this.title,
    this.content,
    this.onTap,
    this.buttonTitle,
  }) : super(key: key);

  final bool? center;
  final String? title;
  final String? content;
  final VoidCallback? onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getWidth(context) * 0.7,
              width: getWidth(context) * 0.7,
              child: Image.asset(
                ImageConstant.contentNotFound,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getVerticalSize(
                  20.00,
                ),
              ),
              child: Text(
                title ?? 'Content not found!',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: getTitleTheme(context),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Text(
                  content ?? '',
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: getTitle2Theme(context),
                ),
              ),
            ),
            Visibility(
              visible: buttonTitle != null,
              child: ElevatedButton(
                onPressed: onTap,
                child: Text(buttonTitle ?? ''),
              ),
            )
          ],
        ),
      ),
    );
  }
}
