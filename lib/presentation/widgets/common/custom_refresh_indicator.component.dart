import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({Key? key, required this.pulledExtent})
      : super(key: key);

  final double pulledExtent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Transform.scale(
        alignment: Alignment.topCenter,
        scale: _normalize(value: pulledExtent, limitDelta: 200, minValue: 0),
        child: CupertinoActivityIndicator(
          color: Theme.of(context).colorScheme.secondary,
          radius: 20,
        ),
      ),
    );
  }

  double _normalize({
    required double value,
    required double minValue,
    required double limitDelta,
  }) {
    final result = (value - minValue) / limitDelta;

    if (result > 1.0) return 1.0;

    if (result < 0.0) return 0.0;

    return result;
  }
}
