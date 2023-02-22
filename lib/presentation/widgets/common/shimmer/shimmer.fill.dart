import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFill extends StatelessWidget {
  final Widget child;
  final double widgetRadius;

  const ShimmerFill({required this.child, this.widgetRadius = 0.0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PhysicalModel(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(4),
      color: Colors.transparent,
      child: Shimmer.fromColors(
        baseColor: _getBaseColor(context) ?? Colors.grey,
        highlightColor: theme.scaffoldBackgroundColor,
        child: Container(
          decoration: BoxDecoration(
              color: theme.appBarTheme.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(widgetRadius))),
          child: child,
        ),
      ),
    );
  }

  Color? _getBaseColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.brightness == ThemeMode.dark
        ? theme.appBarTheme.backgroundColor
        : Colors.grey.shade200;
  }
}
