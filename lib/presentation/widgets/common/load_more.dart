import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadMoreIndicatorView extends StatelessWidget {
  const LoadMoreIndicatorView(
      {Key? key, required this.visible, this.indicatorColor, this.radius})
      : super(key: key);

  final bool visible;
  final Color? indicatorColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Visibility(
        visible: visible,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(bottom: 80),
          child: CupertinoActivityIndicator(
            radius: radius ?? 15,
            color: indicatorColor ?? theme.iconTheme.color,
          ),
        ),
      ),
    );
  }
}
