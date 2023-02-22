import 'package:flutter/material.dart';

class FlushBarNotification {
  static showSnack(
    BuildContext context, {
    String? title,
    String? subTitle,
    Duration? duration,
    String? actionLabel,
    Color? actionLabelColor,
    VoidCallback? onTapAction,
  }) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
              Visibility(
                visible: subTitle != null,
                child: const SizedBox(
                  height: 10,
                ),
              ),
              Visibility(
                visible: subTitle != null,
                child: Text(
                  subTitle ?? '',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
              )
            ],
          ),
        ),
        action: SnackBarAction(
          label: actionLabel ?? '',
          onPressed: onTapAction ?? () {},
          textColor: actionLabelColor,
        ),
      ),
    );
  }
}
