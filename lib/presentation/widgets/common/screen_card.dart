import 'package:test_today/core/app_extensions.dart';
import 'package:flutter/material.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({
    Key? key,
    this.child,
    this.color,
    this.cornerRadius,
    this.margin,
    this.padding,
    this.elevation = 3,
    this.withBorder,
    this.withShadow,
    this.borderRadius,
    this.shape,
    this.shadowColor,
  }) : super(key: key);
  final Widget? child;
  final Color? color;
  final double? cornerRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double elevation;
  final bool? withBorder;
  final bool? withShadow;
  final double? borderRadius;
  final ShapeBorder? shape;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cornerRadius ?? 10),
                topRight: Radius.circular(cornerRadius ?? 10),
              ),
              boxShadow: withShadow ?? false
                  ? <BoxShadow>[
                      BoxShadow(
                        color: shadowColor ?? Colors.grey.withOpacity(0.3),
                        blurRadius: 10.0,
                        blurStyle: BlurStyle.normal,
                      ),
                    ]
                  : [],
            ),
          ),
        ),
        Card(
          color: color ?? theme.cardColor,
          elevation: elevation,
          margin: margin,
          clipBehavior: Clip.antiAlias,
          shadowColor: context.isDarkTheme() ? null : Colors.black87,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
                side: withBorder ?? false
                    ? const BorderSide(
                        width: 0,
                      )
                    : BorderSide.none,
              ),
          child: Container(
            padding: padding,
            child: child,
          ),
        ),
      ],
    );
  }
}
