import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/widgets.dart';

/// Used with [ElevarmCheckboxTheme] or can be passed directly to
/// button widget parameter to configure the color of buttons.
class ElevarmCheckboxThemeData {
  final Color borderColor;
  final Color borderCheckedColor;
  final Color borderDisabledColor;
  final Color borderFocusedColor;

  final Color backgroundColor;
  final Color backgroundCheckedColor;
  final Color backgroundDisabledColor;

  final Color iconEnabledColor;
  final Color iconDisabledColor;

  const ElevarmCheckboxThemeData({
    this.borderColor = ElevarmColors.neutral200,
    this.borderCheckedColor = ElevarmColors.primary,
    this.borderDisabledColor = ElevarmColors.neutral200,
    this.borderFocusedColor = ElevarmColors.primary300,
    this.backgroundColor = ElevarmColors.white,
    this.backgroundCheckedColor = ElevarmColors.primary100,
    this.backgroundDisabledColor = ElevarmColors.neutral100,
    this.iconEnabledColor = ElevarmColors.primary,
    this.iconDisabledColor = ElevarmColors.neutral200,
  });
}

/// Used with [ElevarmCheckboxThemeData] to configure the color of buttons.
/// This widget will provide its predecessor's [ElevarmCheckboxThemeData] and
/// every button in the predecessor tree will be configured with its theme data.
class ElevarmCheckboxTheme extends InheritedWidget {
  final ElevarmCheckboxThemeData? checkboxThemeData;

  const ElevarmCheckboxTheme({
    required Widget child,
    super.key,
    this.checkboxThemeData,
  }) : super(child: child);

  static ElevarmCheckboxTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ElevarmCheckboxTheme>();
  }

  @override
  bool updateShouldNotify(ElevarmCheckboxTheme oldWidget) {
    return true;
  }
}
