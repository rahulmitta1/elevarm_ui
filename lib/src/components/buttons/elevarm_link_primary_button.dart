import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Link Primary Button component widget.
class ElevarmLinkPrimaryButton extends StatefulWidget {
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

  /// Theme data for button styling
  final ElevarmLinkButtonThemeData? buttonThemeData;

  const ElevarmLinkPrimaryButton({
    required this.builder,
    required this.onPressed,
    this.height = ElevarmButtonHeights.md,
    this.contentPadding,
    this.buttonThemeData,
    super.key,
  });

  @override
  State<ElevarmLinkPrimaryButton> createState() =>
      _ElevarmLinkPrimaryButtonState();

  /// Creates [ElevarmLinkPrimaryButton] with only text as content.
  factory ElevarmLinkPrimaryButton.text({
    required String text,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    ElevarmLinkButtonThemeData? buttonThemeData,
    Key? key,
  }) {
    return ElevarmLinkPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      buttonThemeData: buttonThemeData,
      builder: (context, isFocused, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.linkButtonThemeData ??
            const ElevarmLinkButtonThemeData();

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
            fontSize:
                ElevarmLinkPrimaryButton.getFontSizeFromButtonHeight(height),
            fontWeight: ElevarmFontWeights.semibold,
          ),
        );
      },
    );
  }

  /// Creates [ElevarmLinkPrimaryButton] with text and icon(s) (leading and/or trailing)
  /// as content.
  factory ElevarmLinkPrimaryButton.icon({
    required String text,
    required IconData? leadingIconAssetName,
    required IconData? trailingIconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    ElevarmLinkButtonThemeData? buttonThemeData =
        const ElevarmLinkButtonThemeData(),
    Key? key,
  }) {
    return ElevarmLinkPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      buttonThemeData: buttonThemeData,
      builder: (context, isFocused, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.linkButtonThemeData ??
            const ElevarmLinkButtonThemeData();
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
                fontSize: ElevarmLinkPrimaryButton.getFontSizeFromButtonHeight(
                  height,
                ),
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

  /// Creates [ElevarmLinkPrimaryButton] with only an icon as content.
  factory ElevarmLinkPrimaryButton.iconOnly({
    required IconData iconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    ElevarmLinkButtonThemeData? buttonThemeData =
        const ElevarmLinkButtonThemeData(),
    Key? key,
  }) {
    return ElevarmLinkPrimaryButton(
      key: key,
      height: height,
      onPressed: onPressed,
      contentPadding: ElevarmButtonIconOnlyPadding.fromButtonHeights(height),
      buttonThemeData: buttonThemeData,
      builder: (context, isFocused, isHovered) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _buttonThemeData = buttonThemeData ??
            ElevarmButtonTheme.of(context)?.linkButtonThemeData ??
            const ElevarmLinkButtonThemeData();
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

  static double getFontSizeFromButtonHeight(double height) {
    double fontSize;
    if (height <= ElevarmButtonHeights.sm) {
      fontSize = ElevarmFontSizes.sm;
    } else if (height <= ElevarmButtonHeights.md) {
      fontSize = ElevarmFontSizes.sm;
    } else if (height <= ElevarmButtonHeights.lg) {
      fontSize = ElevarmFontSizes.md;
    } else if (height <= ElevarmButtonHeights.xl) {
      fontSize = ElevarmFontSizes.md;
    } else {
      fontSize = ElevarmFontSizes.lg;
    }
    return fontSize;
  }
}

class _ElevarmLinkPrimaryButtonState extends State<ElevarmLinkPrimaryButton> {
  /// Whether currently the button is focused.
  bool _isFocused = false;

  /// Whether currently the button is hovered.
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    ElevarmLinkButtonThemeData buttonThemeData = widget.buttonThemeData ??
        ElevarmButtonTheme.of(context)?.linkButtonThemeData ??
        const ElevarmLinkButtonThemeData();

    late Color primaryColor;
    late Color disabledColor;
    late Color hoverColor;
    late Color focusColor;
    primaryColor = buttonThemeData.primaryColor;
    disabledColor = buttonThemeData.disabledColor;
    hoverColor = buttonThemeData.hoverColor;
    focusColor = buttonThemeData.focusColor;
    return Material(
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
          child: widget.builder(context, _isFocused, _isHovered),
        ),
      ),
    );
  }
}
