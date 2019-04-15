
import 'package:example/demos/demo_page.dart';
import 'package:example/demos/demo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Dialog 示例
class DialogDemo extends StatelessWidget {

  final List<DemoTile> _demos = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Dialog',
      doc: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('', style: TextStyle(
            fontWeight: FontWeight.bold
          )),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0, top: 3.0, bottom: 3.0),
                color: Colors.pinkAccent,
                width: 10.0,
                height: 16.0,
              ),
              Expanded(
                child: Text('Material：'),
              )
            ]
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0, top: 3.0, bottom: 3.0),
                color: Colors.lightBlueAccent,
                width: 10.0,
                height: 16.0,
              ),
              Expanded(
                child: Text('Cupertino：'),
              )
            ]
          )
        ]
      ),
      demos: _demos
    );
  }

}