import 'package:flutter/cupertino.dart';

import '../custom_refresh_indicator.component.dart';

typedef OnRefreshCallback = Future<bool> Function();

class PullToRefreshSliverScaffoldComponent extends StatelessWidget {
  const PullToRefreshSliverScaffoldComponent({
    Key? key,
    required this.onRefresh,
    required this.child,
    this.controller,
  }) : super(key: key);

  /// Should return bool value in [onRefresh]
  /// Otherwise, a default delay 2 seconds will be applied
  ///
  final OnRefreshCallback onRefresh;
  final Widget child;

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller ?? ScrollController(),
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            final returnValue = await onRefresh.call();
            if (returnValue == null) {
              return await Future.delayed(const Duration(seconds: 2));
            }
          },
          builder: (c, refreshState, pulledExtent, _, __) {
            return const CustomRefreshIndicator(pulledExtent: 450);
          },
        ),
        child,
      ],
    );
  }
}
