import 'package:flutter/cupertino.dart' hide CupertinoNavigationBar;
import 'package:flutter/material.dart' hide AppBar;
import 'package:flutter/services.dart' show SystemUiOverlayStyle;
import 'package:flutter/widgets.dart';

import '../base_stateless_widget.dart';
import '../flutter/cupertino/nav_bar.dart';
import '../flutter/material/app_bar.dart';
import '../platform/platform.dart';
import '../theme/base_theme.dart';
import '../theme/base_theme_data.dart';

/// BaseAppBar
///
/// *** You need to call the build method manually, otherwise [BaseThemeData.appBarHeight] won't work.
/// *** 使用时需手动调用build方法，否则 [BaseThemeData.appBarHeight] 不起作用
///
/// use CupertinoNavigationBar by cupertino
/// *** use cupertino = { forceUseMaterial: true } force use AppBar on cuperitno.
/// use AppBar by material
/// *** use material = { forceUseCupertino: true } force use CupertinoNavigationBar on material.
///
/// CupertinoNavigationBar: 2021.03.12
/// AppBar: 2021.03.12
/// modify 2021.03.22 by flutter 2.0.3
class BaseAppBar extends BaseStatelessWidget
    implements ObstructingPreferredSizeWidget {
  const BaseAppBar({
    Key? key,
    this.leading,
    this.trailing,
    this.automaticallyImplyLeading = true,
    this.automaticallyImplyMiddle = true,
    this.backgroundColor,
    this.brightness,
    this.previousPageTitle,
    this.middle,
    this.border = const Border(
      bottom: BorderSide(
        color: Color(0x4C000000),
        width: 0.0, // One physical pixel.
        style: BorderStyle.solid,
      ),
    ),
    this.padding,
    this.transitionBetweenRoutes,
    this.heroTag,
    this.backdropFilter,
    this.height,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation = 4.0,
    this.iconTheme,
    this.shadowColor,
    this.shape,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.excludeHeaderSemantics = false,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.foregroundColor,
    this.leadingWidth,
    this.backwardsCompatibility,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    Map<String, dynamic>? cupertino,
    Map<String, dynamic>? material,
  }) : super(key: key, cupertino: cupertino, material: material);

  /// *** general properties start ***

  /// [CupertinoNavigationBar.leading]
  /// or
  /// [AppBar.leading]
  final Widget? leading;

  /// [CupertinoNavigationBar.automaticallyImplyLeading]
  /// or
  /// [AppBar.automaticallyImplyLeading]
  final bool automaticallyImplyLeading;

  /// [CupertinoNavigationBar.automaticallyImplyMiddle]
  /// or
  /// [AppBar.automaticallyImplyMiddle]
  final bool automaticallyImplyMiddle;

  /// [CupertinoNavigationBar.backgroundColor]
  final Color? backgroundColor;

  /// [AppBar.brightness]
  /// or
  /// [CupertinoNavigationBar.backgroundColor]
  final Brightness? brightness;

  /// [CupertinoNavigationBar.toolbarOpacity], cupertino also support
  /// or
  /// [AppBar.toolbarOpacity]
  final double toolbarOpacity;

  /// [CupertinoNavigationBar.bottom], cupertino also support
  /// or
  /// [AppBar.bottom]
  ///
  /// when the (title/middle = null && bootom != null)
  /// the bottom will replace title.
  ///
  /// 当(title/middle = null && bootom != null)时，bottom会替代title
  final PreferredSizeWidget? bottom;

  /// [CupertinoNavigationBar.bottomOpacity], cupertino also support
  /// or
  /// [AppBar.bottomOpacity]
  final double bottomOpacity;

  /// [CupertinoNavigationBar.navBarPersistentHeight]
  /// default is [CupertinoNavigationBar._kNavBarPersistentHeight] = 44.0
  /// or
  /// [AppBar.toolbarHeight]
  /// default is [kToolbarHeight] = 56.0
  ///
  /// If this property is null, then [BaseThemeData.appBarHeight] is used
  /// 1. use by { appBar: BaseAppBar() }, the [BaseThemeData.appBarHeight] won't work,
  ///   will use [preferredSize]'s height
  /// 2. use by { appBar: BaseAppBar().build(context) }, the [BaseThemeData.appBarHeight] will work,
  ///   will replace the [preferredSize]'s height
  /// 3. Pay attention two ways's build order is different
  ///   1.build BaseScaffold brfore build BaseAppBar
  ///   2.build BaseScaffold after build BaseAppBar
  ///
  /// 当为null是，会使用[BaseThemeData.appBarHeight]参数
  /// 1、如果这样使用 { appBar: BaseAppBar() }，则[BaseThemeData.appBarHeight]该参数不起作用，
  ///   将会使用[preferredSize]'s height
  /// 2、如果这样使用 { appBar: BaseAppBar().build(context) }，则[BaseThemeData.appBarHeight]会起作用，
  ///   将会覆盖[preferredSize]'s height
  /// 3、注意2种方式的build顺序不一样，
  ///   1.是先build BaseScaffold, 再build BaseAppBar
  ///   2.是先build BaseAppBar, 再build BaseScaffold
  final double? height;

  /// *** general properties end ***

  /// *** cupertino properties start ***

  /// [CupertinoNavigationBar.previousPageTitle]
  final String? previousPageTitle;

  /// [CupertinoNavigationBar.middle]
  final Widget? middle;

  /// [CupertinoNavigationBar.trailing]
  ///
  /// If this property is null, then [actions] is used, and use [Row] when actions.length > 1
  ///
  /// 当该参数为null时，会使用[actions], actions.length > 1时，会用[Row]组装
  final Widget? trailing;

  /// [CupertinoNavigationBar.border]
  final Border? border;

  /// [CupertinoNavigationBar.padding]
  final EdgeInsetsDirectional? padding;

  /// [CupertinoNavigationBar.transitionBetweenRoutes]
  final bool? transitionBetweenRoutes;

  /// [CupertinoNavigationBar.heroTag]
  final Object? heroTag;

  /// [CupertinoNavigationBar.backdropFilter], default is true
  ///
  /// effective only backgroundColor is transparent.
  /// default is true, will add BackdropFilter when then backgroundColor is transparent.
  ///
  /// 是否加入高斯模糊效果，背景色为透明时有效
  /// 想实现全透明可以设置成false
  final bool? backdropFilter;

  /// *** cupertino properties ened ***

  /// *** material properties start ***

  /// [AppBar.title]
  ///
  /// If this property is null, then [middle] is used
  ///
  /// 当该参数为null时，会使用[middle]
  final Widget? title;

  /// [AppBar.shadowColor]
  final Color? shadowColor;

  /// [AppBar.shape]
  final ShapeBorder? shape;

  /// [AppBar.foregroundColor]
  final Color? foregroundColor;

  /// [AppBar.actions]
  ///
  /// If this property is null, then [trailing] is used
  ///
  /// 当该参数为null时，会使用[trailing]
  final List<Widget>? actions;

  /// [AppBar.flexibleSpace]
  final Widget? flexibleSpace;

  /// [AppBar.elevation]
  final double? elevation;

  /// [AppBar.iconTheme]
  final IconThemeData? iconTheme;

  /// [AppBar.actionsIconTheme]
  final IconThemeData? actionsIconTheme;

  /// [AppBar.textTheme]
  final TextTheme? textTheme;

  /// [AppBar.primary]
  final bool primary;

  /// [AppBar.centerTitle]
  ///
  /// If this property is null, then [BaseThemeData.appBarCenterTitle] is used
  ///
  /// 当该参数为null时，会使用[BaseThemeData.appBarCenterTitle]
  final bool? centerTitle;

  /// [AppBar.titleSpacing]
  final double? titleSpacing;

  /// [AppBar.excludeHeaderSemantics]
  final bool excludeHeaderSemantics;

  /// [AppBar.leadingWidth]
  final double? leadingWidth;

  /// [AppBar.backwardsCompatibility]
  final bool? backwardsCompatibility;

  /// [AppBar.toolbarTextStyle]
  final TextStyle? toolbarTextStyle;

  /// [AppBar.titleTextStyle]
  final TextStyle? titleTextStyle;

  /// [AppBar.systemOverlayStyle]
  final SystemUiOverlayStyle? systemOverlayStyle;

  /// *** material properties end ***

  @override
  Widget buildByCupertino(BuildContext context) {
    final Widget? _leading = valueFromCupertino('leading', leading);
    // trailing为null，且actions不为null，数量大于1，取trailing = adctions[0];
    Widget? _trailing = valueFromCupertino('trailing', trailing);
    final List<Widget>? _actions = valueFromMaterial('actions', actions);
    if (_actions != null && _actions.isNotEmpty && _trailing == null) {
      if (actions!.length == 1) {
        _trailing = _actions[0];
      } else {
        _trailing = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _actions,
        );
      }
    }
    final BaseThemeData baseTheme = BaseTheme.of(context);
    final Widget? _title = valueFromCupertino('middle', middle) ??
        valueFromCupertino('title', title);
    // 没有backgroundColor使用CupertinoTheme里的barBackgroundColor，还没有使用原生的
    final Color? _backgroundColor =
        valueFromCupertino('backgroundColor', backgroundColor);
    final double _toolbarOpacity =
        valueFromCupertino('toolbarOpacity', toolbarOpacity);

    // 当背景颜色透明时，不加入高斯模糊
    bool _backdropFilter = backdropFilter ??
        baseTheme.valueFromCupertino(
          'appBarBackdropFilter',
          baseTheme.appBarBackdropFilter,
        ) ??
        true;
    // 背景色不透明不加模糊
    if (_backgroundColor?.alpha == 0xFF) {
      _backdropFilter = false;
    }
    CupertinoNavigationBar cupertinoNavigationBar;
    final double? _height = valueFromCupertino('height', height) ??
        baseTheme.valueFromCupertino('appBarHeight', baseTheme.appBarHeight);
    final bool? transitionBetweenRoutes =
        this.transitionBetweenRoutes ?? baseTheme.appBarTransitionBetweenRoutes;
    if (heroTag != null) {
      cupertinoNavigationBar = CupertinoNavigationBar(
        leading: _leading,
        automaticallyImplyLeading: valueFromCupertino(
          'automaticallyImplyLeading',
          automaticallyImplyLeading,
        ),
        automaticallyImplyMiddle: automaticallyImplyMiddle,
        previousPageTitle: previousPageTitle,
        middle: _title,
        trailing: _trailing,
        border: border,
        backgroundColor: _backgroundColor,
        brightness: valueFromCupertino('brightness', brightness),
        padding: padding,
        transitionBetweenRoutes: transitionBetweenRoutes!,
        heroTag: heroTag!,
        backdropFilter: _backdropFilter,
        navBarPersistentHeight: _height,
        bottom: valueFromCupertino('bottom', bottom),
        bottomOpacity: valueFromCupertino('bottomOpacity', bottomOpacity),
        toolbarOpacity: _toolbarOpacity,
      );
    } else {
      cupertinoNavigationBar = CupertinoNavigationBar(
        key: valueFromCupertino('key', key),
        leading: _leading,
        automaticallyImplyLeading: valueFromCupertino(
          'automaticallyImplyLeading',
          automaticallyImplyLeading,
        ),
        automaticallyImplyMiddle: automaticallyImplyMiddle,
        previousPageTitle: previousPageTitle,
        middle: _title,
        trailing: _trailing,
        border: border,
        backgroundColor: _backgroundColor,
        brightness: valueFromCupertino('brightness', brightness),
        padding: padding,
        transitionBetweenRoutes: transitionBetweenRoutes!,
        backdropFilter: _backdropFilter,
        navBarPersistentHeight: _height,
        bottom: valueFromCupertino('bottom', bottom),
        bottomOpacity: valueFromCupertino('bottomOpacity', bottomOpacity),
        toolbarOpacity: _toolbarOpacity,
      );
    }
    return cupertinoNavigationBar;
  }

  @override
  Widget buildByMaterial(BuildContext context) {
    final Widget? _title = valueFromMaterial('title', title) ??
        valueFromMaterial('middle', middle);
    Widget? _leading = valueFromMaterial('leading', leading);
    final EdgeInsetsDirectional? _padding = valueFromMaterial(
      'padding',
      padding,
    );
    if (_padding != null && _leading != null) {
      _leading = Padding(
        padding: EdgeInsets.only(left: _padding.start),
        child: _leading,
      );
    }
    // actions为null，且trailing不为nul,，取trailing = [ trailing ];
    List<Widget>? _actions = valueFromMaterial('actions', actions);
    final Widget? _trailing = valueFromMaterial('trailing', trailing);
    if (_actions == null && _trailing != null) {
      _actions = <Widget>[_trailing];
    }
    final Color? _backgroundColor = valueFromMaterial(
      'backgroundColor',
      backgroundColor,
    );

    final BaseThemeData baseTheme = BaseTheme.of(context);
    final double? _height = valueFromMaterial('height', height) ??
        baseTheme.valueFromMaterial('appBarHeight', baseTheme.appBarHeight);
    final bool centerTitle = this.centerTitle ??
        baseTheme.valueFromMaterial(
          'appBarCenterTitle',
          baseTheme.appBarCenterTitle,
        ) ??
        Theme.of(context).platform == TargetPlatform.iOS;
    return AppBar(
      leading: _leading,
      automaticallyImplyLeading: valueFromMaterial(
        'automaticallyImplyLeading',
        automaticallyImplyLeading,
      ),
      title: _title,
      actions: _actions,
      flexibleSpace: flexibleSpace,
      bottom: valueFromMaterial('bottom', bottom),
      elevation: valueFromMaterial('elevation', elevation),
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: _backgroundColor,
      brightness: valueFromMaterial('brightness', brightness),
      iconTheme: valueFromMaterial('iconTheme', iconTheme),
      actionsIconTheme: valueFromMaterial('actionsIconTheme', actionsIconTheme),
      textTheme: valueFromMaterial('textTheme', textTheme),
      primary: valueFromMaterial('primary', primary),
      centerTitle: centerTitle,
      titleSpacing: valueFromMaterial('titleSpacing', titleSpacing),
      excludeHeaderSemantics: excludeHeaderSemantics,
      toolbarOpacity: valueFromMaterial('toolbarOpacity', toolbarOpacity),
      bottomOpacity: valueFromMaterial('bottomOpacity', bottomOpacity),
      toolbarHeight: _height,
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    if (useCupertino) {
      final Color backgroundColor =
          CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
              CupertinoTheme.of(context).barBackgroundColor;
      return backgroundColor.alpha == 0xFF;
    }
    return true;
  }

  /// 1. use by { appBar: BaseAppBar() }, the [BaseThemeData.appBarHeight] won't work,
  ///   will use [preferredSize]'s height
  /// 2. use by { appBar: BaseAppBar().build(context) }, the [BaseThemeData.appBarHeight] will work,
  ///   will replace the [preferredSize]'s height
  /// 3. Pay attention, two ways's build order is different
  ///   1.build BaseScaffold brfore build BaseAppBar
  ///   2.build BaseScaffold after build BaseAppBar
  ///
  /// 当为null是，会使用[BaseThemeData.appBarHeight]参数
  /// 1、如果这样使用 { appBar: BaseAppBar() }，则[BaseThemeData.appBarHeight]该参数不起作用，
  ///   将会使用[preferredSize]'s height
  /// 2、如果这样使用 { appBar: BaseAppBar().build(context) }，则[BaseThemeData.appBarHeight]会起作用，
  ///   将会覆盖[preferredSize]'s height
  /// 3、注意2种方式的build顺序不一样，
  ///   1.是先build BaseScaffold, 再build BaseAppBar
  ///   2.是先build BaseAppBar, 再build BaseScaffold
  @override
  Size get preferredSize {
    double _height =
        height != null ? height! : (useCupertino ? 44.0 : kToolbarHeight);
    final Widget? middle = valueFromMaterial('title', title) ??
        valueFromMaterial('middle', this.middle);
    if (middle != null && bottom != null) {
      _height += bottom!.preferredSize.height;
    }
    return Size.fromHeight(_height);
  }
}
