import 'package:base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'provider/app_provider.dart';

const String _version = '2.0.3';
const String _flutter_version = '2.0.3';

const TextStyle _style = TextStyle(
  fontSize: 14.0,
);

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, _) {
        return BaseScaffold(
          appBar: const BaseAppBar(
            title: Text('设置'),
            transitionBetweenRoutes: true,
          ),
          safeAreaTop: true,
          body: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      BaseSection(
                        margin: const EdgeInsets.only(top: 10.0),
                        header: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            '当前平台模式：${useCupertino ? 'Cupertino' : 'Material'}',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        children: <Widget>[
                          BaseTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            title: const Text('切换平台模式'),
                            trailing: BaseSwitch(
                              value: currentPlatformMode != defaultPlatformMode,
                              onChanged: (_) {
                                PlatformMode? platformMode =
                                    appProvider.platformMode;
                                platformMode = platformMode?.changePlatformMode(
                                    mode: currentPlatformMode ==
                                            BaseMode.cupertino
                                        ? BaseMode.material
                                        : BaseMode.cupertino);

                                appProvider.changePlatformMode(platformMode);
                              },
                            ),
                          ),
                        ],
                      ),
                      // BaseSection(
                      //   margin: const EdgeInsets.only(top: 10.0),
                      //   header: const Padding(
                      //     padding: EdgeInsets.only(left: 10.0),
                      //     child: Text(
                      //       '主题',
                      //       style:
                      //           TextStyle(fontSize: 12.0, color: Colors.grey),
                      //     ),
                      //   ),
                      //   children: <Widget>[
                      //     BaseTile(
                      //       contentPadding: const EdgeInsets.symmetric(
                      //         horizontal: 10.0,
                      //       ),
                      //       title: const Text('切换主题颜色'),
                      //       trailing: Container(
                      //         width: 50,
                      //         child: Row(
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: <Widget>[
                      //             Container(
                      //               color: appProvider.primaryColor,
                      //               width: 20,
                      //               height: 20,
                      //             ),
                      //             const BaseIcon(
                      //               icon: CupertinoIcons.right_chevron,
                      //               size: 25,
                      //               color: Colors.grey,
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //       onTap: () {
                      //         BaseRoute<dynamic>(
                      //           ThemePage(),
                      //           fullscreenGackGesture: true,
                      //         ).push(context);
                      //       },
                      //     )
                      //   ],
                      // ),
                      const BaseSection(
                        margin: EdgeInsets.only(top: 20.0),
                        children: <Widget>[
                          BaseTile(
                            titleText: 'Flutter版本',
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: Text(
                                _flutter_version,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          BaseTile(
                            titleText: 'App版本',
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: Text(
                                _version,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      '使用 ',
                      style: _style,
                    ),
                    FlutterLogo(
                      size: 18.0,
                    ),
                    Text(
                      ' Flutter技术构建',
                      style: _style,
                    ),
                  ],
                ),
              ],
            ),
          ),
          cupertino: const <String, dynamic>{
            'backgroundColor': CupertinoColors.systemGroupedBackground,
          },
        );
      },
    );
  }
}
