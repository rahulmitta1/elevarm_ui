import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/widgets.dart';

/// Used with [ElevarmAlertTheme] or can be passed directly to
/// [ElevarmAlert] widget parameter to configure the theme of the widget.
class ElevarmAlertThemeData {
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color titleTextColor;
  final Color subtitleTextColor;
  final Color closeIconColor;
  final ElevarmLinkButtonThemeData secondaryButtonTheme;
  final ElevarmLinkButtonThemeData primaryButtonTheme;

  const ElevarmAlertThemeData({
    this.iconColor = ElevarmColors.primary600,
    this.backgroundColor = ElevarmColors.primary100,
    this.borderColor = ElevarmColors.primary200,
    this.titleTextColor = ElevarmColors.primary,
    this.subtitleTextColor = ElevarmColors.primary,
    this.closeIconColor = ElevarmColors.primary400,
    this.secondaryButtonTheme = const ElevarmLinkButtonThemeData(
      onPrimaryColor: ElevarmColors.primary400,
    ),
    this.primaryButtonTheme = const ElevarmLinkButtonThemeData(),
  });
}

/// Used with [ElevarmAlertThemeData] to configure the theme of [ElevarmAlert].
/// This widget will provide its predecessor's [ElevarmAlertThemeData] and
/// every alert in the predecessor tree will be configured with its theme data.
class ElevarmAlertTheme extends InheritedWidget {
  final ElevarmAlertThemeData? alertThemeData;

  const ElevarmAlertTheme({
    required Widget child,
    this.alertThemeData,
    super.key,
  }) : super(child: child);

  static ElevarmAlertTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ElevarmAlertTheme>();
  }

  @override
  bool updateShouldNotify(ElevarmAlertTheme oldWidget) {
    return true;
  }
}
