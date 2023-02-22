import 'package:flutter/material.dart';

class ModuleCompletionPopup extends StatefulWidget {
  final double initial;
  final double achived;
  final String? title;
  final String? subTitle;

  const ModuleCompletionPopup({
    Key? key,
    required this.initial,
    required this.achived,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  _ModuleCompletionPopupState createState() => _ModuleCompletionPopupState();
}

class _ModuleCompletionPopupState extends State<ModuleCompletionPopup> {
  bool expand = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 600)).then((value) {
      setState(() {
        expand = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.72,
        height: 190.0,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0), color: Theme.of(context).appBarTheme.backgroundColor),
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 24.0,
                    width: 24.0,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      padding: EdgeInsets.zero,
                    ),
                  )
                ],
              ),
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0), color: Theme.of(context).primaryColor.withOpacity(0.3)),
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                child: Text(
                  widget.title ?? 'Module completed',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 17.0, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.subTitle ?? 'Great! you’ve just completed your module!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 13.0),
                ),
              ),
              Container(
                height: 6.0,
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? const Color(0xFFEBEAEA)
                        : Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(3.0)),
                child: AnimatedContainer(
                  width: (MediaQuery.of(context).size.width * 0.72 - 32.0) * (expand ? widget.achived : widget.initial),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeOutExpo,
                  height: 6.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6FCF97),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
