import 'package:base/base.dart';
import 'package:example/demos/demo_page.dart';
import 'package:example/demos/demo_tile.dart';
import 'package:example/demos/utils/color_block.dart';
import 'package:example/iconfont/iconfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/painting.dart';

/// TextField Demo
class TextFieldDemo extends StatelessWidget {
  TextFieldDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DemoTile> _demos = <DemoTile>[
      DemoTile(
        page: _Demo(),
      )
    ];
    return DemoPage(
      title: 'TextField',
      doc: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'BaseTextField',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              ColorBlock.material(),
              const Expanded(
                child: Text('Material：use TextField'),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ColorBlock.cupertino(),
              const Expanded(
                child: Text('Cupertino：use CupertinoTextField'),
              ),
            ],
          ),
          const Text('\nSpecific parameter'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ColorBlock.attributes(),
              const Expanded(
                child: Text('materialDecoration: TextField\'s decoration'),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ColorBlock.attributes(),
              const Expanded(
                child: Text('cupertinoDecoration: CupertinoTextField\'s decoration'),
              )
            ],
          )
        ],
      ),
      demos: _demos,
    );
  }
}

class _Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<_Demo> {

  String name = '';
  String password = '';
  TextEditingController controller1;
  TextEditingController controller2;
  bool showPassword = false;

  final EdgeInsets padding = const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0);

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final BaseIconButton eyeButton = BaseIconButton(
      icon: BaseIcon(
        icon: showPassword ? IconFont.eyeopen : IconFont.eyeclose,
        // color: Colors.black54,
      ),
      onPressed: () {
        setState(() {
          showPassword = !showPassword;
        });
      },
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: BaseTextField(
              controller: controller1,
              autofocus: true,
              padding: padding,
              // 暂时解决中文光标上移问题，emoji依旧还是有点上移
              style: DefaultTextStyle.of(context).style.copyWith(
                height: 1.2,
              ),
              onChanged: (String value) {
                setState(() {
                  name = value;
                });
              },
              clearButtonMode: OverlayVisibilityMode.editing,
              textInputAction: TextInputAction.next,
              placeholder: 'name',
              prefix: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: BaseIcon(
                  icon: IconFont.profile,
                  color: Colors.black54,
                ),
              ),
              materialDecoration: InputDecoration(
                labelText: 'name',
                contentPadding: padding,
                prefixIcon: BaseIcon(
                  icon: IconFont.profile,
                ),
              ),
            )
          ),
          Container(
            color: Colors.white,
            child: BaseTextField(
              controller: controller2,
              autofocus: true,
              padding: padding,
              style: DefaultTextStyle.of(context).style.copyWith(
                height: 1.2,
              ),
              onChanged: (String value) {
                setState(() {
                  password = value;
                });
              },
              clearButtonMode: OverlayVisibilityMode.editing,
              obscureText: showPassword ? false: true,
              textInputAction: TextInputAction.done,
              placeholder: 'password',
              prefix: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: BaseIcon(
                  icon: IconFont.password,
                  color: Colors.black54,
                ),
              ),
              suffix: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: eyeButton,
              ),
              materialDecoration: InputDecoration(
                labelText: 'password',
                contentPadding: padding,
                prefixIcon: BaseIcon(
                  icon: IconFont.password,
                ),
                suffixIcon: eyeButton
              ),
            )
          ),
        ],
      ),
    );
  }
}