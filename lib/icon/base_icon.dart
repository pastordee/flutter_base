import 'package:flutter/widgets.dart'
    show BuildContext, Color, Icon, IconData, Key, TextDirection, Widget;

import '../base_stateless_widget.dart';

// BaseIcon
/// use Icon by cupertino
/// *** use cupertino = { forceUseMaterial: true } force use Icon on cuperitno.
/// use Icon by material
/// *** use material = { forceUseCupertino: true } force use Icon on material.
/// 
/// Icon: 2020.12.09
/// modify 2021.03.26 by flutter 2.0.3
class BaseIcon extends BaseStatelessWidget {
  const BaseIcon({
    Key? key,
    this.icon,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
    Map<String, dynamic>? cupertino,
    Map<String, dynamic>? material,
  }) : super(key: key, cupertino: cupertino, material: material);

  /// [Icon.icon]
  final IconData? icon;

  /// [Icon.size]
  final double? size;

  /// [Icon.color]
  final Color? color;

  /// [Icon.semanticLabel]
  final String? semanticLabel;

  /// [Icon.textDirection]
  final TextDirection? textDirection;

  @override
  Widget buildByCupertino(BuildContext context) {
    return Icon(
      valueFromCupertino('icon', icon),
      key: valueFromCupertino('key', key),
      size: valueFromCupertino('size', size),
      color: valueFromCupertino('color', color),
      semanticLabel: valueFromCupertino('semanticLabel', semanticLabel),
      textDirection: valueFromCupertino('textDirection', textDirection),
    );
  }

  @override
  Widget buildByMaterial(BuildContext context) {
    return Icon(
      valueFromMaterial('icon', icon),
      key: valueFromMaterial('key', key),
      size: valueFromMaterial('size', size),
      color: valueFromMaterial('color', color),
      semanticLabel: valueFromMaterial('semanticLabel', semanticLabel),
      textDirection: valueFromMaterial('textDirection', textDirection),
    );
  }
}
