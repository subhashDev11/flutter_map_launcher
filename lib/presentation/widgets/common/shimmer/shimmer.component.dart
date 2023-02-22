import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponent extends StatelessWidget {
  const ShimmerComponent({
    Key? key,
    required this.child,
    this.widgetRadius = 0.0,
  }) : super(key: key);

  final Widget child;
  final double widgetRadius;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(4),
      color: Colors.transparent,
      child: Shimmer.fromColors(
        baseColor: _getBaseColor(context),
        highlightColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(widgetRadius)),
          ),
          child: child,
        ),
      ),
    );
  }

  Color _getBaseColor(BuildContext c) {
    final theme = Theme.of(c);
    return theme.brightness == ThemeMode.dark
        ? const Color(0xFF333333)
        : Colors.grey.shade300;
  }
}
