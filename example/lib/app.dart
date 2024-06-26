import 'package:base/base.dart';
import 'package:example/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'provider/app_provider.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget? child) {
        CupertinoThemeData _cupertinoTheme = CupertinoTheme.of(context);
        _cupertinoTheme = _cupertinoTheme.copyWith(
          brightness: appProvider.brightness,
        );
        ThemeData _theme = ThemeData.light();
        ThemeData _darkTheme = ThemeData.dark();
        _theme = _theme.copyWith(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          cupertinoOverrideTheme: _cupertinoTheme,
          textTheme: _theme.textTheme.copyWith(
            bodyMedium: _theme.textTheme.bodyMedium?.copyWith(
              fontSize: 17.0,
              letterSpacing: -0.41,
            ),
          ),
          buttonTheme: _theme.buttonTheme.copyWith(
            // 使FlatButton, OutlineButton，RaisedButton等按钮跟CupertinoButton一样高
            height: 48.0,
          ),
          dialogBackgroundColor: const Color(0xFFEBEBEB),
          scaffoldBackgroundColor: const Color(0xFFF5F5FF),
        );
        _darkTheme = _darkTheme.copyWith(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          // cupertinoOverrideTheme: _cupertinoTheme,
          textTheme: _darkTheme.textTheme.copyWith(
            bodyMedium: _darkTheme.textTheme.bodyMedium?.copyWith(
              fontSize: 17.0,
              letterSpacing: -0.41,
            ),
          ),
          buttonTheme: _darkTheme.buttonTheme.copyWith(
            // 使FlatButton, OutlineButton，RaisedButton等按钮跟CupertinoButton一样高
            height: 48.0,
          ),
          dialogBackgroundColor: Colors.white,
          scaffoldBackgroundColor: const Color(0xFF191919),
          cardColor: const Color.fromARGB(255, 28, 28, 30),
          appBarTheme: _darkTheme.appBarTheme.copyWith(
            // brightness: Brightness.dark,
          ),
        );
        return BaseApp(
          title: 'Base_Example',
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: const Locale('zh', 'CN'),
          supportedLocales: const <Locale>[Locale('zh', 'CN'), Locale('en', 'US')],
          home: child,
          baseTheme: BaseThemeData(
            cupertinoTheme: _cupertinoTheme,
            materialTheme: _theme,
            materialDarkTheme: _darkTheme,
            appBarHeight: appProvider.appBarHeight,
            appBarTransitionBetweenRoutes: false,
            platformMode: appProvider.platformMode,
            routeFullscreenGackGesture: appProvider.routeFullscreenGackGesture!,
          ),
          debugShowCheckedModeBanner: false,
          themeMode: appProvider.themeMode,
        );
      },
      child: const Home(),
    );
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness? brightness = WidgetsBinding.instance.window.platformBrightness;
    final AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    if (appProvider != null && appProvider.themeMode == ThemeMode.system && brightness != appProvider.brightness) {
      appProvider.changeBrightness(brightness);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
