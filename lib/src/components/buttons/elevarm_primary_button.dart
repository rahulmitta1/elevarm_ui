import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Primary Button component widget.
class ElevarmPrimaryButton extends StatefulWidget {
  /// The button's height. Use [ElevarmButtonHeights] whenever possible.
  final double height;

  /// The button's child builder.
  final Widget Function(BuildContext context, bool isFocused, bool isHovered)
      builder;

  /// Callback when button is pressed. Set this value to null to disable the
  /// button.
  final VoidCallback? onPressed;

  /// The button's contet padding.
  final EdgeInsetsGeometry? contentPadding;

  /// Whether to style the button as destructive/dangerous.
  final bool isDestructive;

  /// Theme data for button styling
  final ElevarmPrimaryButtonThemeData? buttonThemeData;

  const ElevarmPrimaryButton({
    required this.builder,
    required this.onPressed,
    this.height = ElevarmButtonHeights.md,
    this.contentPadding,
    this.isDestructive = false,
    this.buttonThemeData,
    super.key,
  });

  @override
  State<ElevarmPrimaryButton> createState() => _ElevarmPrimaryButtonState();

  /// Creates [ElevarmPrimaryButton] with only text as content.
  factory ElevarmPrimaryButton.text({
    required String text,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmPrimaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      buttonThemeData: buttonThemeData,
      builder: (_, __, ___) => Text(
        text,
        textAlign: TextAlign.center,
        style: ElevarmFontFamilies.inter(
          color: ElevarmColors.white,
          fontSize: ElevarmButtonTextFontSize.fromButtonHeights(height),
          fontWeight: ElevarmFontWeights.semibold,
        ),
      ),
    );
  }

  /// Creates [ElevarmPrimaryButton] with text and icon(s) (leading and/or trailing)
  /// as content.
  factory ElevarmPrimaryButton.icon({
    required String text,
    required IconData? leadingIconAssetName,
    required IconData? trailingIconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmPrimaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      buttonThemeData: buttonThemeData,
      builder: (_, __, ___) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leadingIconAssetName != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevarmIcon(
                      leadingIconAssetName,
                      color: ElevarmColors.white,
                      size: ElevarmButtonIconSize.fromButtonHeights(height),
                    ),
                    const SizedBox(width: 8.0),
                  ],
                )
              : Container(),
          Text(
            text,
            textAlign: TextAlign.center,
            style: ElevarmFontFamilies.inter(
              color: ElevarmColors.white,
              fontSize: ElevarmButtonTextFontSize.fromButtonHeights(height),
              fontWeight: ElevarmFontWeights.semibold,
            ),
          ),
          trailingIconAssetName != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 8.0),
                    ElevarmIcon(
                      trailingIconAssetName,
                      color: ElevarmColors.white,
                      size: ElevarmButtonIconSize.fromButtonHeights(height),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  /// Creates [ElevarmPrimaryButton] with only an icon as content.
  factory ElevarmPrimaryButton.iconOnly({
    required IconData iconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmPrimaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      contentPadding: ElevarmButtonIconOnlyPadding.fromButtonHeights(height),
      buttonThemeData: buttonThemeData,
      builder: (_, __, ___) => ElevarmIcon(
        iconAssetName,
        color: ElevarmColors.white,
        size: ElevarmButtonIconSize.fromButtonHeights(height),
      ),
    );
  }
}

class _ElevarmPrimaryButtonState extends State<ElevarmPrimaryButton> {
  /// Whether currently the button is focused.
  bool _isFocused = false;

  /// Whether currently the button is hovered.
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    ElevarmButtonThemeData buttonThemeData = widget.buttonThemeData ??
        ElevarmButtonTheme.of(context)?.primaryButtonThemeData ??
        const ElevarmPrimaryButtonThemeData();

    late Color shadowColor;
    late Color primaryColor;
    late Color disabledColor;
    late Color hoverColor;
    late Color focusColor;
    if (!widget.isDestructive) {
      shadowColor = buttonThemeData.shadowColor;
      primaryColor = buttonThemeData.primaryColor;
      disabledColor = buttonThemeData.disabledColor;
      hoverColor = buttonThemeData.hoverColor;
      focusColor = buttonThemeData.focusColor;
    } else {
      shadowColor = const Color(0xFFFEE4E2);
      primaryColor = ElevarmColors.danger;
      disabledColor = ElevarmColors.danger200;
      hoverColor = ElevarmColors.danger600;
      focusColor = ElevarmColors.danger;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ElevarmBorderRadius.sm,
        ),
        boxShadow: !_isFocused
            ? ElevarmBoxShadow.xs
            : [
                const BoxShadow(
                  color: Color.fromRGBO(16, 24, 40, 0.05),
                  offset: Offset(1.0, 0.0),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 4.0,
                ),
              ],
      ),
      child: Material(
        color: widget.onPressed != null ? primaryColor : disabledColor,
        borderRadius: BorderRadius.circular(
          ElevarmBorderRadius.sm,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(
            ElevarmBorderRadius.sm,
          ),
          onFocusChange: (value) {
            setState(() {
              _isFocused = value;
            });
          },
          hoverColor: hoverColor,
          focusColor: focusColor,
          onHover: (value) {
            setState(() {
              _isHovered = value;
            });
          },
          onTap: widget.onPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ElevarmBorderRadius.sm,
              ),
            ),
            child: Padding(
              padding: widget.contentPadding ??
                  ElevarmButtonPadding.fromButtonHeights(widget.height),
              child: widget.builder(context, _isFocused, _isHovered),
            ),
          ),
        ),
      ),
    );
  }
}
