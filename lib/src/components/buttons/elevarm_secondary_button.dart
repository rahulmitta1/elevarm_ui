import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Secondary Button component widget.
class ElevarmSecondaryButton extends StatefulWidget {
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
  final ElevarmSecondaryButtonThemeData? buttonThemeData;

  const ElevarmSecondaryButton({
    required this.builder,
    required this.onPressed,
    this.height = ElevarmButtonHeights.md,
    this.contentPadding,
    this.isDestructive = false,
    this.buttonThemeData,
    super.key,
  });

  @override
  State<ElevarmSecondaryButton> createState() => _ElevarmSecondaryButtonState();

  /// Creates [ElevarmSecondaryButton] with only text as content.
  factory ElevarmSecondaryButton.text({
    required String text,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmSecondaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmSecondaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      buttonThemeData: buttonThemeData,
      builder: (context, __, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.secondaryButtonThemeData ??
            const ElevarmSecondaryButtonThemeData();
        Color textColor;
        if (!isDestructive) {
          textColor = _buttonThemeData.onSecondaryColor;
          if (onPressed == null) {
            textColor = _buttonThemeData.onSecondaryVariantColor;
          } else if (isHovered) {
            textColor = _buttonThemeData.onHoverColor;
          }
        } else {
          textColor = ElevarmColors.danger;
          if (onPressed == null) {
            textColor = ElevarmColors.danger300;
          } else if (isHovered) {
            textColor = ElevarmColors.danger800;
          }
        }
        return Text(
          text,
          textAlign: TextAlign.center,
          style: ElevarmFontFamilies.inter(
            color: textColor,
            fontSize: ElevarmButtonTextFontSize.fromButtonHeights(height),
            fontWeight: ElevarmFontWeights.semibold,
          ),
        );
      },
    );
  }

  /// Creates [ElevarmSecondaryButton] with text and icon(s) (leading and/or trailing)
  /// as content.
  factory ElevarmSecondaryButton.icon({
    required String text,
    required IconData? leadingIconAssetName,
    required IconData? trailingIconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmSecondaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmSecondaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      buttonThemeData: buttonThemeData,
      builder: (context, __, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.secondaryButtonThemeData ??
            const ElevarmSecondaryButtonThemeData();
        Color textColor;
        if (!isDestructive) {
          textColor = _buttonThemeData.onSecondaryColor;
          if (onPressed == null) {
            textColor = _buttonThemeData.onSecondaryVariantColor;
          } else if (isHovered) {
            textColor = _buttonThemeData.onHoverColor;
          }
        } else {
          textColor = ElevarmColors.danger;
          if (onPressed == null) {
            textColor = ElevarmColors.danger300;
          } else if (isHovered) {
            textColor = ElevarmColors.danger800;
          }
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leadingIconAssetName != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevarmIcon(
                        leadingIconAssetName,
                        color: textColor,
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
                color: textColor,
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
                        color: textColor,
                        size: ElevarmButtonIconSize.fromButtonHeights(height),
                      ),
                    ],
                  )
                : Container(),
          ],
        );
      },
    );
  }

  /// Creates [ElevarmSecondaryButton] with only an icon as content.
  factory ElevarmSecondaryButton.iconOnly({
    required IconData iconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmSecondaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmSecondaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      contentPadding: ElevarmButtonIconOnlyPadding.fromButtonHeights(height),
      buttonThemeData: buttonThemeData,
      builder: (context, __, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.secondaryButtonThemeData ??
            const ElevarmSecondaryButtonThemeData();
        Color textColor;
        if (!isDestructive) {
          textColor = _buttonThemeData.onSecondaryColor;
          if (onPressed == null) {
            textColor = _buttonThemeData.onSecondaryVariantColor;
          } else if (isHovered) {
            textColor = _buttonThemeData.onHoverColor;
          }
        } else {
          textColor = ElevarmColors.danger;
          if (onPressed == null) {
            textColor = ElevarmColors.danger300;
          } else if (isHovered) {
            textColor = ElevarmColors.danger800;
          }
        }
        return ElevarmIcon(
          iconAssetName,
          color: textColor,
          size: ElevarmButtonIconSize.fromButtonHeights(height),
        );
      },
    );
  }
}

class _ElevarmSecondaryButtonState extends State<ElevarmSecondaryButton> {
  /// Whether currently the button is focused.
  bool _isFocused = false;

  /// Whether currently the button is hovered.
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    ElevarmSecondaryButtonThemeData buttonThemeData = widget.buttonThemeData ??
        ElevarmButtonTheme.of(context)?.secondaryButtonThemeData ??
        const ElevarmSecondaryButtonThemeData();

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
      primaryColor = ElevarmColors.danger100;
      disabledColor = ElevarmColors.danger100;
      hoverColor = ElevarmColors.danger100;
      focusColor = ElevarmColors.danger100;
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
