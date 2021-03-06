import 'package:base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackdropFilterDemo extends StatefulWidget {
  const BackdropFilterDemo({
    Key? key,
  }) : super(key: key);
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
        backgroundColor:
            CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.0),
        backdropFilter: _backdropFilter,
        border: null,
      ),
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: ListView(
        padding: const EdgeInsets.only(top: 0.0),
        children: <Widget>[
          const SizedBox(
            height: 88.0,
            child: Center(
              child: Text('Now you can see me.'),
            ),
          ),
          SizedBox(
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
          ),
        ],
      ),
    );
  }
}
