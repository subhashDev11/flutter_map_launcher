import 'package:test_today/core/mixins/app_styles_mixin.dart';
import 'package:flutter/material.dart';

class SheetContent extends StatelessWidget with AppStyleMixin {
  const SheetContent({Key? key, required this.content, this.radius})
      : super(key: key);
  final Widget content;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: getTheme(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: content,
          ),
        ),
        Positioned(
          top: -90,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.close,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
