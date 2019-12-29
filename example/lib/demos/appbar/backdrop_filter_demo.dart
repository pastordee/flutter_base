
import 'package:base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackdropFilterDemo extends StatefulWidget {

  @override
  _BackdropFilterDemoState createState() => _BackdropFilterDemoState();

}

class _BackdropFilterDemoState extends State<BackdropFilterDemo> {

  bool _backdropFilter = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: const Text('backdropFilter'),
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.0),
        backdropFilter: _backdropFilter,
        border: null,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: ListView(
        padding: const EdgeInsets.only(top: 0.0),
        children: <Widget>[
          Container(
            height: 88.0,
            child: const Center(
              child: Text('Now you can see me.'),
            ),
          ),
          Container(
            child: BaseTile(
              titleText: 'backdropFilter',
              trailing: BaseSwitch(
                value: _backdropFilter,
                onChanged: (bool value) {
                  setState(() {
                    _backdropFilter = value;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

}