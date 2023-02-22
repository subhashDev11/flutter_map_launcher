import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({this.title, this.subTitle, Key? key}) : super(key: key);

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 4, top: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title ?? '',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                if (subTitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(subTitle ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 13)),
                  ),
              ],
            ),
            MaterialButton(
              height: 20,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    'View more',
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.chevron_right,
                      color: Theme.of(context).primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
