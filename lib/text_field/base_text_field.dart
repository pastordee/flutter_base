import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart'
    show
        CupertinoColors,
        CupertinoDynamicColor,
        CupertinoTextField,
        OverlayVisibilityMode;
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart' hide SmartDashesType, SmartQuotesType;
import 'package:flutter/rendering.dart' show MouseCursor;
import 'package:flutter/services.dart'
    show
        MaxLengthEnforcement,
        TextInputFormatter,
        SmartDashesType,
        SmartQuotesType;

import '../base_stateless_widget.dart';

// BaseTextField
/// use CupertinoTextField by cupertino
/// *** use cupertino = { forceUseMaterial: true } force use TextField on cuperitno.
/// use TextField by material
/// *** use material = { forceUseCupertino: true } force use CupertinoTextField on material.
///
/// CupertinoTextField: 2021.01.28
/// TextField: 2021.01.28
/// modify 2021.03.26 by flutter 2.0.3
class BaseTextField extends BaseStatelessWidget {
  const BaseTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.readOnly = false,
    this.showCursor,
    this.toolbarOptions,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius = const Radius.circular(2.0),
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.restorationId,
    this.maxLengthEnforcement,
    this.onTap,
    // cupertino
    this.cupertinoDecoration = _kDefaultRoundedBorderDecoration,
    this.padding = const EdgeInsets.all(6.0),
    this.placeholder,
    this.placeholderStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: CupertinoColors.placeholderText,
    ),
    this.prefix,
    this.prefixMode = OverlayVisibilityMode.always,
    this.suffix,
    this.suffixMode = OverlayVisibilityMode.always,
    this.clearButtonMode = OverlayVisibilityMode.never,
    // material
    this.materialDecoration = const InputDecoration(),
    this.textDirection,
    this.buildCounter,
    this.mouseCursor,
    this.selectionControls,
    this.onAppPrivateCommand,
    Map<String, dynamic>? cupertino,
    Map<String, dynamic>? material,
  }) : super(key: key, cupertino: cupertino, material: material);

  /// *** general properties start ***

  /// [CupertinoTextField.controller]
  /// or
  /// [TextField.controller]
  final TextEditingController? controller;

  /// [CupertinoTextField.focusNode]
  /// or
  /// [TextField.focusNode]
  final FocusNode? focusNode;

  /// [CupertinoTextField.keyboardType]
  /// or
  /// [TextField.keyboardType]
  final TextInputType? keyboardType;

  /// [CupertinoTextField.textInputAction]
  /// or
  /// [TextField.textInputAction]
  final TextInputAction? textInputAction;

  /// [CupertinoTextField.textCapitalization]
  /// or
  /// [TextField.textCapitalization]
  final TextCapitalization textCapitalization;

  /// [CupertinoTextField.style]
  /// or
  /// [TextField.style]
  final TextStyle? style;

  /// [CupertinoTextField.strutStyle]
  /// or
  /// [TextField.strutStyle]
  final StrutStyle? strutStyle;

  /// [CupertinoTextField.textAlign]
  /// or
  /// [TextField.textAlign]
  final TextAlign textAlign;

  /// [CupertinoTextField.toolbarOptions]
  /// or
  /// [TextField.toolbarOptions]
  final ToolbarOptions? toolbarOptions;

  /// [CupertinoTextField.textAlignVertical]
  /// or
  /// [TextField.textAlignVertical]
  final TextAlignVertical? textAlignVertical;

  /// [CupertinoTextField.readOnly]
  /// or
  /// [TextField.readOnly]
  final bool readOnly;

  /// [CupertinoTextField.showCursor]
  /// or
  /// [TextField.showCursor]
  final bool? showCursor;

  /// [CupertinoTextField.autofocus]
  /// or
  /// [TextField.autofocus]
  final bool autofocus;

  /// [CupertinoTextField.obscureText]
  /// or
  /// [TextField.obscureText]
  final bool obscureText;

  /// [CupertinoTextField.autocorrect]
  /// or
  /// [TextField.autocorrect]
  final bool autocorrect;

  /// [CupertinoTextField.smartDashesType]
  /// or
  /// [TextField.smartDashesType]
  final SmartDashesType? smartDashesType;

  /// [CupertinoTextField.smartQuotesType]
  /// or
  /// [TextField.smartQuotesType]
  final SmartQuotesType? smartQuotesType;

  /// [CupertinoTextField.enableSuggestions]
  /// or
  /// [TextField.enableSuggestions]
  final bool enableSuggestions;

  /// [CupertinoTextField.maxLines]
  /// or
  /// [TextField.maxLines]
  final int maxLines;

  /// [CupertinoTextField.minLines]
  /// or
  /// [TextField.minLines]
  final int? minLines;

  /// [CupertinoTextField.expands]
  /// or
  /// [TextField.expands]
  final bool expands;

  /// [CupertinoTextField.maxLength]
  /// or
  /// [TextField.maxLength]
  final int? maxLength;

  /// [CupertinoTextField.maxLengthEnforcement]
  /// or
  /// [TextField.maxLengthEnforcement]
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// [CupertinoTextField.onChanged]
  /// or
  /// [TextField.onChanged]
  final ValueChanged<String>? onChanged;

  /// [CupertinoTextField.onEditingComplete]
  /// or
  /// [TextField.onEditingComplete]
  final VoidCallback? onEditingComplete;

  /// [CupertinoTextField.onSubmitted]
  /// or
  /// [TextField.onSubmitted]
  final ValueChanged<String>? onSubmitted;

  /// [CupertinoTextField.inputFormatters]
  /// or
  /// [TextField.inputFormatters]
  final List<TextInputFormatter>? inputFormatters;

  /// [CupertinoTextField.enabled]
  /// or
  /// [TextField.enabled]
  final bool? enabled;

  /// [CupertinoTextField.cursorWidth]
  /// or
  /// [TextField.cursorWidth]
  final double cursorWidth;

  /// [CupertinoTextField.cursorRadius]
  /// or
  /// [TextField.cursorRadius]
  final Radius cursorRadius;

  /// [CupertinoTextField.cursorColor]
  /// or
  /// [TextField.cursorColor]
  final Color? cursorColor;

  /// [CupertinoTextField.keyboardAppearance]
  /// or
  /// [TextField.keyboardAppearance]
  final Brightness? keyboardAppearance;

  /// [CupertinoTextField.scrollPadding]
  /// or
  /// [TextField.scrollPadding]
  final EdgeInsets scrollPadding;

  /// [CupertinoTextField.dragStartBehavior]
  /// or
  /// [TextField.dragStartBehavior]
  final DragStartBehavior dragStartBehavior;

  /// [CupertinoTextField.enableInteractiveSelection]
  /// or
  /// [TextField.enableInteractiveSelection]
  final bool enableInteractiveSelection;

  /// [CupertinoTextField.selectionControls]
  /// or
  /// [TextField.selectionControls]
  final TextSelectionControls? selectionControls;

  /// [CupertinoTextField.scrollController]
  /// or
  /// [TextField.scrollController]
  final ScrollController? scrollController;

  /// [CupertinoTextField.scrollPhysics]
  /// or
  /// [TextField.scrollPhysics]
  final ScrollPhysics? scrollPhysics;

  /// [CupertinoTextField.obscuringCharacter]
  /// or
  /// [TextField.obscuringCharacter]
  final String obscuringCharacter;

  /// [CupertinoTextField.selectionHeightStyle]
  /// or
  /// [TextField.selectionHeightStyle]
  final ui.BoxHeightStyle selectionHeightStyle;

  /// [CupertinoTextField.selectionWidthStyle]
  /// or
  /// [TextField.selectionWidthStyle]
  final ui.BoxWidthStyle selectionWidthStyle;

  /// [CupertinoTextField.cursorHeight]
  /// or
  /// [TextField.cursorHeight]
  final double? cursorHeight;

  /// [CupertinoTextField.autofillHints]
  /// or
  /// [TextField.autofillHints]
  final Iterable<String>? autofillHints;

  /// [CupertinoTextField.restorationId]
  /// or
  /// [TextField.restorationId]
  final String? restorationId;

  /// [CupertinoTextField.onTap]
  /// or
  /// [TextField.onTap]
  final GestureTapCallback? onTap;

  /// *** general properties end ***

  /// *** cupertino properties start ***

  /// [CupertinoTextField.cupertinoDecoration]
  final BoxDecoration cupertinoDecoration;

  /// [CupertinoTextField.padding]
  final EdgeInsetsGeometry padding;

  /// [CupertinoTextField.placeholder]
  final String? placeholder;

  /// [CupertinoTextField.placeholderStyle]
  final TextStyle placeholderStyle;

  /// [CupertinoTextField.prefix]
  final Widget? prefix;

  /// [CupertinoTextField.prefixMode]
  final OverlayVisibilityMode prefixMode;

  /// [CupertinoTextField.suffix]
  final Widget? suffix;

  /// [CupertinoTextField.suffixMode]
  final OverlayVisibilityMode suffixMode;

  /// [CupertinoTextField.clearButtonMode]
  final OverlayVisibilityMode clearButtonMode;

  /// *** cupertino properties end ***

  /// *** material properties start ***

  /// [TextField.materialDecoration]
  final InputDecoration materialDecoration;

  /// [TextField.textDirection]
  final TextDirection? textDirection;

  /// [TextField.buildCounter]
  final InputCounterWidgetBuilder? buildCounter;

  /// [TextField.onAppPrivateCommand]
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// [TextField.buildCmouseCursorounter]
  final MouseCursor? mouseCursor;

  /// *** material properties end ***

  @override
  Widget buildByCupertino(BuildContext context) {
    return CupertinoTextField(
      controller: valueFromCupertino('controller', controller),
      focusNode: valueFromCupertino('focusNode', focusNode),
      keyboardType: valueFromCupertino('keyboardType', keyboardType),
      textInputAction: valueFromCupertino('textInputAction', textInputAction),
      textCapitalization: valueFromCupertino(
        'textCapitalization',
        textCapitalization,
      ),
      style: valueFromCupertino('style', style),
      strutStyle: valueFromCupertino('strutStyle', strutStyle),
      textAlign: valueFromCupertino('textAlign', textAlign),
      textAlignVertical: valueFromCupertino(
        'textAlignVertical',
        textAlignVertical,
      ),
      readOnly: valueFromCupertino('readOnly', readOnly),
      toolbarOptions: valueFromCupertino('toolbarOptions', toolbarOptions),
      showCursor: valueFromCupertino('showCursor', showCursor),
      autofocus: valueFromCupertino('autofocus', autofocus),
      obscuringCharacter:
          valueFromCupertino('obscuringCharacter', obscuringCharacter),
      obscureText: valueFromCupertino('obscureText', obscureText),
      autocorrect: valueFromCupertino('autocorrect', autocorrect),
      smartDashesType: valueFromCupertino('smartDashesType', smartDashesType),
      smartQuotesType: valueFromCupertino('smartQuotesType', smartQuotesType),
      enableSuggestions:
          valueFromCupertino('enableSuggestions', enableSuggestions),
      maxLines: valueFromCupertino('maxLines', maxLines),
      minLines: valueFromCupertino('minLines', minLines),
      expands: valueFromCupertino('expands', expands),
      maxLength: valueFromCupertino('maxLength', maxLength),
      maxLengthEnforcement: valueFromCupertino(
        'maxLengthEnforcement',
        maxLengthEnforcement,
      ),
      onChanged: valueFromCupertino('onChanged', onChanged),
      onEditingComplete: valueFromCupertino(
        'onEditingComplete',
        onEditingComplete,
      ),
      onSubmitted: valueFromCupertino('onSubmitted', onSubmitted),
      inputFormatters: valueFromCupertino('inputFormatters', inputFormatters),
      enabled: valueFromCupertino('enabled', enabled),
      cursorWidth: valueFromCupertino('cursorWidth', cursorWidth),
      cursorHeight: valueFromCupertino('cursorHeight', cursorHeight),
      cursorRadius: valueFromCupertino('cursorRadius', cursorRadius),
      cursorColor: valueFromCupertino('cursorColor', cursorColor),
      selectionHeightStyle:
          valueFromCupertino('selectionHeightStyle', selectionHeightStyle),
      selectionWidthStyle:
          valueFromCupertino('selectionWidthStyle', selectionWidthStyle),
      keyboardAppearance: valueFromCupertino(
        'keyboardAppearance',
        keyboardAppearance,
      ),
      scrollPadding: valueFromCupertino('scrollPadding', scrollPadding),
      dragStartBehavior: valueFromCupertino(
        'dragStartBehavior',
        dragStartBehavior,
      ),
      enableInteractiveSelection: valueFromCupertino(
        'enableInteractiveSelection',
        enableInteractiveSelection,
      ),
      selectionControls: valueFromCupertino(
        'selectionControls',
        selectionControls,
      ),
      onTap: valueFromCupertino('onTap', onTap),
      scrollController: valueFromCupertino(
        'scrollController',
        scrollController,
      ),
      scrollPhysics: valueFromCupertino('scrollPhysics', scrollPhysics),
      autofillHints: valueFromCupertino('autofillHints', autofillHints),
      restorationId: valueFromCupertino('restorationId', restorationId),
      // cupertino
      decoration: cupertinoDecoration,
      padding: padding,
      placeholder: placeholder,
      placeholderStyle: placeholderStyle,
      prefix: prefix,
      prefixMode: prefixMode,
      suffix: suffix,
      suffixMode: suffixMode,
      clearButtonMode: clearButtonMode,
    );
  }

  @override
  Widget buildByMaterial(BuildContext context) {
    return TextField(
      controller: valueFromMaterial('controller', controller),
      focusNode: valueFromMaterial('focusNode', focusNode),
      keyboardType: valueFromMaterial('keyboardType', keyboardType),
      textInputAction: valueFromMaterial('textInputAction', textInputAction),
      textCapitalization: valueFromMaterial(
        'textCapitalization',
        textCapitalization,
      ),
      style: valueFromMaterial('style', style),
      strutStyle: valueFromMaterial('strutStyle', strutStyle),
      textAlign: valueFromMaterial('textAlign', textAlign),
      textAlignVertical: valueFromMaterial(
        'textAlignVertical',
        textAlignVertical,
      ),
      readOnly: valueFromMaterial('readOnly', readOnly),
      toolbarOptions: valueFromMaterial('toolbarOptions', toolbarOptions),
      showCursor: valueFromMaterial('showCursor', showCursor),
      autofocus: valueFromMaterial('autofocus', autofocus),
      obscuringCharacter:
          valueFromMaterial('obscuringCharacter', obscuringCharacter),
      obscureText: valueFromMaterial('obscureText', obscureText),
      autocorrect: valueFromMaterial('autocorrect', autocorrect),
      smartDashesType: valueFromMaterial('smartDashesType', smartDashesType),
      smartQuotesType: valueFromMaterial('smartQuotesType', smartQuotesType),
      enableSuggestions: valueFromMaterial(
        'enableSuggestions',
        enableSuggestions,
      ),
      maxLines: valueFromMaterial('maxLines', maxLines),
      minLines: valueFromMaterial('minLines', minLines),
      expands: valueFromMaterial('expands', expands),
      maxLength: valueFromMaterial('maxLength', maxLength),
      maxLengthEnforcement:
          valueFromMaterial('maxLengthEnforcement', maxLengthEnforcement),
      onChanged: valueFromMaterial('onChanged', onChanged),
      onEditingComplete: valueFromMaterial(
        'onEditingComplete',
        onEditingComplete,
      ),
      onSubmitted: valueFromMaterial('onSubmitted', onSubmitted),
      onAppPrivateCommand:
          valueFromMaterial('onAppPrivateCommand', onAppPrivateCommand),
      inputFormatters: valueFromMaterial('inputFormatters', inputFormatters),
      enabled: valueFromMaterial('enabled', enabled),
      cursorWidth: valueFromMaterial('cursorWidth', cursorWidth),
      cursorHeight: valueFromMaterial('cursorHeight', cursorHeight),
      cursorRadius: valueFromMaterial('cursorRadius', cursorRadius),
      cursorColor: valueFromMaterial('cursorColor', cursorColor),
      selectionHeightStyle:
          valueFromMaterial('selectionHeightStyle', selectionHeightStyle),
      selectionWidthStyle:
          valueFromMaterial('selectionWidthStyle', selectionWidthStyle),
      keyboardAppearance: valueFromMaterial(
        'keyboardAppearance',
        keyboardAppearance,
      ),
      scrollPadding: valueFromMaterial('scrollPadding', scrollPadding),
      dragStartBehavior: valueFromMaterial(
        'dragStartBehavior',
        dragStartBehavior,
      ),
      enableInteractiveSelection: valueFromMaterial(
        'enableInteractiveSelection',
        enableInteractiveSelection,
      ),
      selectionControls: valueFromMaterial(
        'selectionControls',
        selectionControls,
      ),
      mouseCursor: valueFromMaterial(
        'mouseCursor',
        mouseCursor,
      ),
      scrollController: valueFromMaterial(
        'scrollController',
        scrollController,
      ),
      scrollPhysics: valueFromMaterial('scrollPhysics', scrollPhysics),
      autofillHints: valueFromMaterial('autofillHints', autofillHints),
      restorationId: valueFromMaterial('scrollPhysics', restorationId),
      // material
      decoration: materialDecoration,
      textDirection: textDirection,
      onTap: onTap,
      buildCounter: buildCounter,
    );
  }
}

// Value inspected from Xcode 11 & iOS 13.0 Simulator.
const BorderSide _kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoDynamicColor.withBrightness(
    color: Color(0x33000000),
    darkColor: Color(0x33FFFFFF),
  ),
  style: BorderStyle.solid,
  width: 0.0,
);

const Border _kDefaultRoundedBorder = Border(
  top: _kDefaultRoundedBorderSide,
  bottom: _kDefaultRoundedBorderSide,
  left: _kDefaultRoundedBorderSide,
  right: _kDefaultRoundedBorderSide,
);

const BoxDecoration _kDefaultRoundedBorderDecoration = BoxDecoration(
  color: CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white,
    darkColor: CupertinoColors.black,
  ),
  border: _kDefaultRoundedBorder,
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
);
