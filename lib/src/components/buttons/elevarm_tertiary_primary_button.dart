import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Tertiary Primary Button component widget.
class ElevarmTertiaryPrimaryButton extends StatefulWidget {
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
  final ElevarmTertiaryButtonThemeData? buttonThemeData;

  const ElevarmTertiaryPrimaryButton({
    required this.builder,
    required this.onPressed,
    this.height = ElevarmButtonHeights.md,
    this.contentPadding,
    this.isDestructive = false,
    this.buttonThemeData,
    super.key,
  });

  @override
  State<ElevarmTertiaryPrimaryButton> createState() =>
      _ElevarmTertiaryPrimaryButtonState();

  /// Creates [ElevarmTertiaryPrimaryButton] with only text as content.
  factory ElevarmTertiaryPrimaryButton.text({
    required String text,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmTertiaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmTertiaryPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      buttonThemeData: buttonThemeData,
      builder: (context, isFocused, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.tertiaryPrimaryButtonThemeData ??
            const ElevarmTertiaryButtonThemeData();
        Color textColor;
        if (!isHovered) {
          textColor = onPressed != null
              ? _buttonThemeData.onPrimaryColor
              : _buttonThemeData.onPrimaryVariantColor;
        } else {
          textColor = ElevarmColors.primary800;
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

  /// Creates [ElevarmTertiaryPrimaryButton] with text and icon(s) (leading and/or trailing)
  /// as content.
  factory ElevarmTertiaryPrimaryButton.icon({
    required String text,
    required IconData? leadingIconAssetName,
    required IconData? trailingIconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmTertiaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmTertiaryPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      buttonThemeData: buttonThemeData,
      builder: (context, isFocused, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.tertiaryPrimaryButtonThemeData ??
            const ElevarmTertiaryButtonThemeData();
        Color textColor;
        if (!isHovered) {
          textColor = onPressed != null
              ? _buttonThemeData.onPrimaryColor
              : _buttonThemeData.onPrimaryVariantColor;
        } else {
          textColor = ElevarmColors.primary800;
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

  /// Creates [ElevarmTertiaryPrimaryButton] with only an icon as content.
  factory ElevarmTertiaryPrimaryButton.iconOnly({
    required IconData iconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    ElevarmTertiaryButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmTertiaryPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      contentPadding: ElevarmButtonIconOnlyPadding.fromButtonHeights(height),
      buttonThemeData: buttonThemeData,
      builder: (context, isFocused, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.tertiaryPrimaryButtonThemeData ??
            const ElevarmTertiaryButtonThemeData();
        Color textColor;
        if (!isHovered) {
          textColor = onPressed != null
              ? _buttonThemeData.onPrimaryColor
              : _buttonThemeData.onPrimaryVariantColor;
        } else {
          textColor = ElevarmColors.primary800;
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

class _ElevarmTertiaryPrimaryButtonState
    extends State<ElevarmTertiaryPrimaryButton> {
  /// Whether currently the button is focused.
  bool _isFocused = false;

  /// Whether currently the button is hovered.
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    ElevarmTertiaryButtonThemeData buttonThemeData = widget.buttonThemeData ??
        ElevarmButtonTheme.of(context)?.tertiaryPrimaryButtonThemeData ??
        const ElevarmTertiaryButtonThemeData();

    late Color hoverColor;
    late Color focusColor;
    hoverColor = buttonThemeData.hoverColor;
    focusColor = buttonThemeData.focusColor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ElevarmBorderRadius.sm,
        ),
      ),
      child: Material(
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
          focusColor: focusColor,
          hoverColor: hoverColor,
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
