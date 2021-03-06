import 'package:base/base.dart';
import 'package:flutter/material.dart';

import '../demo_page.dart';
import '../demo_tile.dart';

class IconButtonDemo extends StatelessWidget {
  const IconButtonDemo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    children.add(
      Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: BaseIconButton(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          icon: Icon(
            Icons.add_circle,
            color: const BaseColor.highContrast(
              color: Colors.white,
              darkColor: Colors.black,
            ).build(context),
          ),
          onPressed: () {},
        ),
      ),
    );
    children.add(
      Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: BaseIconButton(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          icon: const Icon(
            Icons.info,
          ),
          onPressed: () {},
        ),
      ),
    );
    children.add(
      const Padding(
        padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: BaseIconButton(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          icon: Icon(
            Icons.image,
            size: 40,
          ),
          minSize: 40,
          iconSize: 40,
          disabledColor: Colors.grey,
        ),
      ),
    );
    return DemoPage(
      widgetName: 'BaseIconButton',
      materialDesc: 'use IconButton',
      cupertinoDesc: 'use CupertinoButton',
      tips: 'If you want to have a label with the icon, '
          'suggest use the BaseButton.icon',
      demos: <DemoTile>[
        DemoTile(
          page: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: children,
            ),
          ),
        ),
      ],
    );
  }
}
