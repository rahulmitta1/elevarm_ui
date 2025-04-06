import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Used with [ElevarmButtonTheme] or can be passed directly to
/// button widget parameter to configure the color of buttons.
class ElevarmButtonThemeData {
  final Color shadowColor;
  final Color primaryColor;
  final Color disabledColor;
  final Color hoverColor;
  final Color focusColor;

  const ElevarmButtonThemeData({
    required this.shadowColor,
    required this.primaryColor,
    required this.disabledColor,
    required this.hoverColor,
    required this.focusColor,
  });
}

/// Used with [ElevarmPrimaryButton] to configure colors.
class ElevarmPrimaryButtonThemeData extends ElevarmButtonThemeData {
  const ElevarmPrimaryButtonThemeData({
    Color shadowColor = const Color(0xFFF4EBFF),
    Color primaryColor = ElevarmColors.primary,
    Color disabledColor = ElevarmColors.primary200,
    Color hoverColor = ElevarmColors.primary600,
    Color focusColor = ElevarmColors.primary,
  }) : super(
          shadowColor: shadowColor,
          primaryColor: primaryColor,
          disabledColor: disabledColor,
          hoverColor: hoverColor,
          focusColor: focusColor,
        );
}

/// Used with [ElevarmSecondaryButton] to configure colors.
class ElevarmSecondaryButtonThemeData extends ElevarmButtonThemeData {
  final Color onSecondaryColor;
  final Color onSecondaryVariantColor;
  final Color onHoverColor;

  const ElevarmSecondaryButtonThemeData({
    this.onSecondaryColor = ElevarmColors.primary,
    this.onSecondaryVariantColor = ElevarmColors.primary300,
    this.onHoverColor = ElevarmColors.primary800,
    Color shadowColor = const Color(0xFFF4EBFF),
    Color primaryColor = ElevarmColors.primary100,
    Color disabledColor = ElevarmColors.primary100,
    Color hoverColor = ElevarmColors.primary100,
    Color focusColor = ElevarmColors.primary100,
  }) : super(
          shadowColor: shadowColor,
          primaryColor: primaryColor,
          disabledColor: disabledColor,
          hoverColor: hoverColor,
          focusColor: focusColor,
        );
}

/// Used with [ElevarmOutlineButton] to configure colors.
class ElevarmOutlineButtonThemeData extends ElevarmButtonThemeData {
  final Color onSurfaceColor;
  final Color onSurfaceVariantColor;
  final Color borderColor;

  const ElevarmOutlineButtonThemeData({
    this.onSurfaceColor = ElevarmColors.neutral,
    this.onSurfaceVariantColor = ElevarmColors.neutral100,
    this.borderColor = ElevarmColors.neutral100,
    Color shadowColor = const Color(0xFFF2F4F7),
    Color primaryColor = ElevarmColors.white,
    Color disabledColor = ElevarmColors.white,
    Color hoverColor = ElevarmColors.neutral100,
    Color focusColor = ElevarmColors.white,
  }) : super(
          shadowColor: shadowColor,
          primaryColor: primaryColor,
          disabledColor: disabledColor,
          hoverColor: hoverColor,
          focusColor: focusColor,
        );
}

/// Used with [ElevarmLinkPrimaryButton] to configure colors.
class ElevarmLinkButtonThemeData extends ElevarmButtonThemeData {
  final Color onPrimaryColor;
  final Color onPrimaryVariantColor;

  const ElevarmLinkButtonThemeData({
    this.onPrimaryColor = ElevarmColors.primary,
    this.onPrimaryVariantColor = ElevarmColors.neutral100,
    Color shadowColor = const Color(0xFFF2F4F7),
    Color primaryColor = Colors.transparent,
    Color disabledColor = Colors.transparent,
    Color hoverColor = Colors.transparent,
    Color focusColor = Colors.transparent,
  }) : super(
          shadowColor: shadowColor,
          primaryColor: primaryColor,
          disabledColor: disabledColor,
          hoverColor: hoverColor,
          focusColor: focusColor,
        );

  factory ElevarmLinkButtonThemeData.neutral() {
    return const ElevarmLinkButtonThemeData(
      onPrimaryColor: ElevarmColors.neutral400,
    );
  }
}

/// Used with [ElevarmTertiaryPrimaryButton] to configure colors.
class ElevarmTertiaryButtonThemeData extends ElevarmButtonThemeData {
  final Color onPrimaryColor;
  final Color onPrimaryVariantColor;

  const ElevarmTertiaryButtonThemeData({
    this.onPrimaryColor = ElevarmColors.primary,
    this.onPrimaryVariantColor = ElevarmColors.neutral100,
    Color shadowColor = const Color(0xFFF2F4F7),
    Color primaryColor = ElevarmColors.primary100,
    Color disabledColor = Colors.transparent,
    Color hoverColor = ElevarmColors.primary100,
    Color focusColor = Colors.transparent,
  }) : super(
          shadowColor: shadowColor,
          primaryColor: primaryColor,
          disabledColor: disabledColor,
          hoverColor: hoverColor,
          focusColor: focusColor,
        );

  factory ElevarmTertiaryButtonThemeData.neutral() {
    return const ElevarmTertiaryButtonThemeData(
      onPrimaryColor: ElevarmColors.neutral400,
      primaryColor: ElevarmColors.neutral100,
    );
  }
}

/// Used with [ButtonThemeData] to configure the color of buttons.
/// This widget will provide its predecessor's [ElevarmButtonThemeData] and
/// every button in the predecessor tree will be configured with its theme data.
class ElevarmButtonTheme extends InheritedWidget {
  const ElevarmButtonTheme({
    required Widget child,
    super.key,
    this.primaryButtonThemeData,
    this.secondaryButtonThemeData,
    this.outlineButtonThemeData,
    this.linkButtonThemeData,
    this.tertiaryPrimaryButtonThemeData,
  }) : super(child: child);

  final ElevarmPrimaryButtonThemeData? primaryButtonThemeData;
  final ElevarmSecondaryButtonThemeData? secondaryButtonThemeData;
  final ElevarmOutlineButtonThemeData? outlineButtonThemeData;
  final ElevarmLinkButtonThemeData? linkButtonThemeData;
  final ElevarmTertiaryButtonThemeData? tertiaryPrimaryButtonThemeData;

  static ElevarmButtonTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ElevarmButtonTheme>();
  }

  @override
  bool updateShouldNotify(ElevarmButtonTheme oldWidget) {
    return oldWidget != this;
  }
}
