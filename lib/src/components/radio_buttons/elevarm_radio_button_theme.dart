import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/widgets.dart';

/// Used with [ElevarmRadioButtonTheme] or can be passed directly to
/// button widget parameter to configure the color of buttons.
class ElevarmRadioButtonThemeData {
  final Color titleColor;
  final Color subtitleColor;
  final Color hoverColor;
  final Color focusColor;
  final Color primaryColor;
  final Color backgroundColor;
  final Color backgroundActiveColor;
  final Color backgroundDisabledColor;
  final Color borderColor;
  final Color borderActiveColor;
  final Color borderFocusedColor;
  final Color borderDisabledColor;

  const ElevarmRadioButtonThemeData({
    this.titleColor = ElevarmColors.neutral,
    this.subtitleColor = ElevarmColors.neutral300,
    this.hoverColor = ElevarmColors.primary100,
    this.focusColor = ElevarmColors.white,
    this.primaryColor = ElevarmColors.primary,
    this.backgroundColor = ElevarmColors.white,
    this.backgroundActiveColor = ElevarmColors.primary100,
    this.backgroundDisabledColor = ElevarmColors.neutral100,
    this.borderColor = ElevarmColors.neutral200,
    this.borderActiveColor = ElevarmColors.primary,
    this.borderFocusedColor = ElevarmColors.primary300,
    this.borderDisabledColor = ElevarmColors.neutral200,
  });
}

/// Used with [ElevarmRadioButtonThemeData] to configure the color of buttons.
/// This widget will provide its predecessor's [ElevarmRadioButtonThemeData] and
/// every button in the predecessor tree will be configured with its theme data.
class ElevarmRadioButtonTheme extends InheritedWidget {
  final ElevarmRadioButtonThemeData? data;

  const ElevarmRadioButtonTheme({
    required Widget child,
    super.key,
    this.data,
  }) : super(child: child);

  static ElevarmRadioButtonTheme? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ElevarmRadioButtonTheme>();
  }

  @override
  bool updateShouldNotify(ElevarmRadioButtonTheme oldWidget) {
    return true;
  }
}
