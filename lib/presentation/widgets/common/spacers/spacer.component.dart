import 'package:flutter/material.dart';

class SpacerVertical extends SizedBox {
  const SpacerVertical({required double height, Key? key})
      : super(height: height, key: key);
}

class SpacerHorizontal extends SizedBox {
  const SpacerHorizontal(double width, {Key? key})
      : super(width: width, key: key);
}

class SpacerVerticalVisible extends DecoratedBox {
  SpacerVerticalVisible({Key? key, double? height, Color? color})
      : super(
          key: key,
          decoration: BoxDecoration(color: color ?? Colors.grey.shade300),
          child: SizedBox(
            height: height,
            width: double.maxFinite,
          ),
        );
}
