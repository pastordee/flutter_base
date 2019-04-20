
import 'package:base/base.dart';
import 'package:example/store/action.dart';
import 'package:example/store/app_state.dart';
import 'package:example/theme_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _SettingsViewModel>(
      converter: (Store<AppState> store) {
        return _SettingsViewModel(
          targetPlatform: store.state.targetPlatform,
          primaryColor: store.state.primaryColor,
          changePlatform: (TargetPlatform targetPlatform) => store.dispatch(PlatformAction(targetPlatform: targetPlatform))
        );
      },
      builder: (BuildContext context, _SettingsViewModel vm) {
        return BaseScaffold(
          appBar: BaseAppBar(
            title: const Text('设置'),
            transitionBetweenRoutes: false,
          ),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  BaseSection(
                    margin: const EdgeInsets.only(top: 10.0),
                    header: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('当前平台模式：${useCupertino ? 'Cupertino' : 'Material'}',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey
                        ),
                      ),
                    ),
                    children: <Widget>[
                      BaseTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                        title: const Text('切换平台模式'),
                        trailing: BaseSwitch(
                          value: basePlatform == defaultTargetPlatform ? false : true,
                          onChanged: (_) {
                            final TargetPlatform targetPlatform = vm.targetPlatform == TargetPlatform.iOS ? TargetPlatform.android : TargetPlatform.iOS;
                            vm.changePlatform(targetPlatform);
                          },
                        ),
                      )
                    ],
                  ),
                  BaseSection(
                    margin: const EdgeInsets.only(top: 10.0),
                    header: const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('主题',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey
                        ),
                      ),
                    ),
                    children: <Widget>[
                      BaseTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                        title: const Text('切换主题颜色'),
                        trailing: Container(
                          width: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                color: vm.primaryColor,
                                width: 20,
                                height: 20,
                              ),
                              BaseIcon(
                                icon: CupertinoIcons.right_chevron,
                                size: 25,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          BaseRoute<dynamic>(ThemePage()).push(context);
                        },
                      )
                    ],
                  ),
                  BaseSection(
                    margin: const EdgeInsets.only(top: 20.0),
                    children: <Widget>[
                      BaseTile(
                        titleText: '版本',
                        trailing: const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Text('0.1.1',
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        );
      }
    );
  }
  
}

class _SettingsViewModel {
  const _SettingsViewModel({
    this.targetPlatform, 
    this.primaryColor,

    this.changePlatform,
  });

  final TargetPlatform targetPlatform;
  final Color primaryColor;

  final void Function(TargetPlatform targetPlatform) changePlatform;

}