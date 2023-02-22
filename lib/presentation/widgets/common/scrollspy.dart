import 'package:flutter/material.dart';

class ScrollSpy extends StatefulWidget {
  const ScrollSpy(this.scrollCtrl, {super.key});

  final ScrollController scrollCtrl;

  @override
  _ScrollSpyState createState() => _ScrollSpyState();
}

class _ScrollSpyState extends State<ScrollSpy> {
  @override
  void initState() {
    super.initState();

    widget.scrollCtrl.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();

    widget.scrollCtrl.removeListener(scrollListener);
  }

  void scrollListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double progress = 0;
    if (widget.scrollCtrl.position.hasContentDimensions) {
      progress = widget.scrollCtrl.position.pixels /
          widget.scrollCtrl.position.maxScrollExtent;
    }

    if (progress.isNaN || progress.isInfinite) {
      progress = 100.0;
    }

    return SizedBox(
      height: 3,
      child: LinearProgressIndicator(
        value: progress,
      ),
    );
  }
}
