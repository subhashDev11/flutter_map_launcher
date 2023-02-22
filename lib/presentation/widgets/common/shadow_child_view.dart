import 'package:flutter/material.dart';

class ShadowChildView extends StatelessWidget {
  const ShadowChildView(
      {Key? key,
      this.shadowPadding,
      this.bottomShadow,
      required this.child,
      this.shadowColor,
      this.leftRightShadow,
      this.cornerRadius})
      : super(key: key);
  final Widget child;
  final Color? shadowColor;
  final EdgeInsets? shadowPadding;
  final bool? bottomShadow;
  final bool? leftRightShadow;
  final bool? cornerRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: shadowPadding ??
          EdgeInsets.only(
              top: 8,
              right: leftRightShadow ?? true ? 8 : 0,
              left: leftRightShadow ?? true ? 8 : 0,
              bottom: bottomShadow ?? true ? 5 : 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? theme.cardColor.withOpacity(0.15),
            blurRadius: 10.0,
            blurStyle: BlurStyle.normal,
          )
        ],
        borderRadius: cornerRadius ?? true ? BorderRadius.circular(5.0) : BorderRadius.zero,
      ),
      child: child,
    );
  }
}
