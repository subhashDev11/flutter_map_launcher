import 'package:flutter/material.dart';

typedef IntCallback = void Function(int id);
typedef OnBackPressed = void Function();

class TabBarScaffoldComponent extends StatefulWidget {
  const TabBarScaffoldComponent({
    Key? key,
    required this.onTabChanged,
    required this.children,
    this.title,
    this.centerTitle = false,
    this.onBackPressed,
    this.hideAppBar = false,
    this.tabTitle,
  })  : assert(
          children.length == 4 || children.length == 5,
          'Children length should be 4 or 5. See the TabBarScaffoldComponent appTabs',
        ),
        super(key: key);

  final String? title;
  final bool centerTitle;
  final bool hideAppBar;
  final IntCallback onTabChanged;
  final OnBackPressed? onBackPressed;
  final List<String>? tabTitle;

  /// The children length should be 4 (as of now).
  /// Each will represent the following
  /// [All, Reads, Quizzes, Tracks]
  final List<Widget> children;

  @override
  _TabBarScaffoldComponentState createState() =>
      _TabBarScaffoldComponentState();
}

class _TabBarScaffoldComponentState extends State<TabBarScaffoldComponent>
    with SingleTickerProviderStateMixin {
  List<String>? get appTabs => widget.tabTitle;

  late TabController _tabController;

  Widget? get _showTitle {
    if (widget.title == null) {
      return null;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(widget.title ?? '', style: Theme.of(context).textTheme.titleMedium)
      ],
    );
  }

  Widget _tabText(String text) {
    final color = _color(context);
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color),
    );
  }

  Color _color(BuildContext c) {
    final theme = Theme.of(c);

    if (theme == ThemeMode.dark) {
      return Colors.white;
    }
    return Theme.of(context).textTheme.titleMedium?.color ?? Colors.black87;
  }

  Decoration _indicator(BuildContext c) {
    return UnderlineTabIndicator(
      borderSide: BorderSide(color: _color(c), width: 4),
    );
  }

  Widget _leadingWidget(BuildContext c) {
    final theme = Theme.of(c);

    return BackButton(
        color: theme.brightness == ThemeMode.dark ? Colors.white : Colors.black,
        onPressed: widget.onBackPressed);
  }

  @override
  void initState() {
    super.initState();

    final length = widget.children.length;
    _tabController = TabController(vsync: this, length: length);
  }

  Widget _renderTabBar() => TabBar(
        controller: _tabController,
        onTap: (int index) => widget.onTabChanged.call(index),
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        indicator: _indicator(context),
        labelColor: _color(context),
        labelStyle: Theme.of(context).textTheme.titleMedium,
        tabs: widget.children,
      );

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == ThemeMode.dark;
    return Scaffold(
      appBar: widget.hideAppBar
          ? AppBar(
              title: _renderTabBar(),
              toolbarHeight: kMinInteractiveDimension,
              backgroundColor: darkMode ? Colors.black87 : Colors.white,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              centerTitle: widget.centerTitle,
              leading: _leadingWidget(context),
              title: _showTitle,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: _renderTabBar(),
                  ),
                ),
              ),
            ),
      body: TabBarView(controller: _tabController, children: widget.children),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
