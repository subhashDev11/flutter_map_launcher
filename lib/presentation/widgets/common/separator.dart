import 'package:flutter/material.dart';

class SeparatorLine extends StatelessWidget {
  const SeparatorLine({Key? key, this.color, this.height}) : super(key: key);
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height ?? 1.0,
      color: color ??
          (theme.brightness == ThemeMode.dark
              ? Colors.white70
              : Colors.blueGrey.shade200),
    );
  }
}
