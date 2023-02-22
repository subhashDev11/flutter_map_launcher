import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetService {
  /// A action bottom sheet that adapts to the platform (Android/iOS).
  ///
  /// [actions] The Actions list that will appear on the ActionSheet. (required)
  ///
  /// [cancelAction] The optional cancel button that show under the
  /// actions (grouped separately on iOS).
  ///
  /// [title] The optional title widget that show above the actions.
  ///
  /// The optional [backgroundColor] and [barrierColor] can be passed in to
  /// customize the appearance and behavior of persistent bottom sheets.
  /// {@tool sample}
  ///
  /// This snippet shows how to use a [showAdaptiveActionSheet].
  ///
  /// ```dart
  /// final _bottomSheetSVC = locator<BottomSheetService>();
  /// _bottomSheetSVC.showAdaptiveActionSheet(
  ///   context: context,
  ///   actions: <BottomSheetAction>[
  ///     BottomSheetAction(title: 'Share', onPressed: () {}),
  ///     BottomSheetAction(
  ///       color: Colors.red,
  ///       title: 'Abandon Track',
  ///       onPressed: () {},
  ///     ),
  ///   ],
  ///   cancelAction: CancelAction(),
  /// );
  /// ```
  /// {@end-tool}
  Future<Future> showAdaptiveActionSheet<T>({
    required BuildContext context,
    required List<BottomSheetAction> actions,
    Widget? title,
    required CancelAction cancelAction,
    Color? barrierColor,
    Color? bottomSheetColor,
  }) async {
    assert(
      barrierColor != Colors.transparent,
      'The barrier color cannot be transparent.',
    );

    return _show<T>(
      context,
      title,
      actions,
      cancelAction,
      barrierColor,
      bottomSheetColor,
    );
  }
}

// INTERNALS
Future _show<T>(
  BuildContext context,
  Widget? title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color? barrierColor,
  Color? bottomSheetColor,
) {
  if (Platform.isIOS) {
    return _showCupertinoBottomSheet(
      context,
      title,
      actions,
      cancelAction,
    );
  } else {
    return _showMaterialBottomSheet(
      context,
      title,
      actions,
      cancelAction,
      barrierColor,
      bottomSheetColor,
    );
  }
}

Future _showCupertinoBottomSheet<T>(
  BuildContext context,
  Widget? title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
) {
  return showCupertinoModalPopup(
    context: context,
    builder: (BuildContext coxt) {
      return CupertinoActionSheet(
        title: title,
        actions: actions.map((action) {
          final color = action.color;
          final style = TextStyle(color: color);

          return CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(coxt).pop();
              action.onPressed();
            },
            child: Text(
              action.title,
              style: style,
            ),
          );
        }).toList(),
        cancelButton: cancelAction != null
            ? CupertinoActionSheetAction(
                onPressed: cancelAction.onPressed,
                child: Text(cancelAction.title),
              )
            : null,
      );
    },
  );
}

Future<T?> _showMaterialBottomSheet<T>(
  BuildContext context,
  Widget? title,
  List<BottomSheetAction> actions,
  CancelAction cancelAction,
  Color? barrierColor,
  Color? bottomSheetColor,
) {
  return showCupertinoModalPopup<T>(
    context: context,
    useRootNavigator: true,
    builder: (BuildContext coxt) {
      return CupertinoActionSheet(
        title: Center(child: title ?? const Text('Select Actions')),
        actions: actions
            .map((e) => CupertinoActionSheetAction(
                onPressed: e.onPressed, child: Text(e.title)))
            .toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: cancelAction.onPressed,
          isDestructiveAction: true,
          child: Text(cancelAction.title),
        ),
      );
    },
  );
}

// END INTERNALS

// EXPOSED MODELS

class BottomSheetAction {
  final String title;

  final VoidCallback onPressed;

  final Color color;

  BottomSheetAction({
    required this.title,
    required this.onPressed,
    this.color = Colors.blue,
  });
}

class CancelAction {
  final String title;
  final VoidCallback onPressed;

  CancelAction({
    this.title = 'Cancel',
    required this.onPressed,
  });
}
