import 'package:flutter/material.dart';

typedef SliverBuilder = Widget Function(BuildContext, int);

class SliverVerticalListComponent extends StatelessWidget {
  const SliverVerticalListComponent({
    Key? key,
    required this.sliverBuilder,
    required this.count,
  }) : super(key: key);

  final SliverBuilder sliverBuilder;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(sliverBuilder, childCount: count),
    );
  }
}
