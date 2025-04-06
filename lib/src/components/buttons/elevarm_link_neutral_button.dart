import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Link Neutral Button component widget.
class ElevarmLinkNeutralButton extends StatefulWidget {
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

  const ElevarmLinkNeutralButton({
    required this.builder,
    required this.onPressed,
    this.height = ElevarmButtonHeights.md,
    this.contentPadding,
    this.isDestructive = false,
    super.key,
  });

  @override
  State<ElevarmLinkNeutralButton> createState() =>
      _ElevarmLinkNeutralButtonState();

  /// Creates [ElevarmLinkNeutralButton] with only text as content.
  factory ElevarmLinkNeutralButton.text({
    required String text,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    Key? key,
  }) {
    return ElevarmLinkNeutralButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      builder: (context, isFocused, isHovered) {
        Color textColor;
        if (!isDestructive) {
          if (!isHovered) {
            textColor = onPressed != null
                ? ElevarmColors.neutral400
                : ElevarmColors.neutral100;
          } else {
            textColor = ElevarmColors.neutral;
          }
        } else {
          if (!isHovered) {
            textColor = onPressed != null
                ? ElevarmColors.danger
                : ElevarmColors.danger300;
          } else {
            textColor = ElevarmColors.danger800;
          }
        }
        return Text(
          text,
          textAlign: TextAlign.center,
          style: ElevarmFontFamilies.inter(
            color: textColor,
            fontSize:
                ElevarmLinkNeutralButton.getFontSizeFromButtonHeight(height),
            fontWeight: ElevarmFontWeights.semibold,
          ),
        );
      },
    );
  }

  /// Creates [ElevarmLinkNeutralButton] with text and icon(s) (leading and/or trailing)
  /// as content.
  factory ElevarmLinkNeutralButton.icon({
    required String text,
    required IconData? leadingIconAssetName,
    required IconData? trailingIconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    Key? key,
  }) {
    return ElevarmLinkNeutralButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      builder: (context, isFocused, isHovered) {
        Color textColor;
        if (!isDestructive) {
          if (!isHovered) {
            textColor = onPressed != null
                ? ElevarmColors.neutral400
                : ElevarmColors.neutral100;
          } else {
            textColor = ElevarmColors.neutral;
          }
        } else {
          if (!isHovered) {
            textColor = onPressed != null
                ? ElevarmColors.danger
                : ElevarmColors.danger300;
          } else {
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
                fontSize: ElevarmLinkNeutralButton.getFontSizeFromButtonHeight(
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

  /// Creates [ElevarmLinkNeutralButton] with only an icon as content.
  factory ElevarmLinkNeutralButton.iconOnly({
    required IconData iconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    Key? key,
  }) {
    return ElevarmLinkNeutralButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      contentPadding: ElevarmButtonIconOnlyPadding.fromButtonHeights(height),
      builder: (context, isFocused, isHovered) {
        Color textColor;
        if (!isDestructive) {
          if (!isHovered) {
            textColor = onPressed != null
                ? ElevarmColors.neutral400
                : ElevarmColors.neutral100;
          } else {
            textColor = ElevarmColors.neutral;
          }
        } else {
          if (!isHovered) {
            textColor = onPressed != null
                ? ElevarmColors.danger
                : ElevarmColors.danger300;
          } else {
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

class _ElevarmLinkNeutralButtonState extends State<ElevarmLinkNeutralButton> {
  /// Whether currently the button is focused.
  bool _isFocused = false;

  /// Whether currently the button is hovered.
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    late Color primaryColor;
    late Color disabledColor;
    late Color hoverColor;
    late Color focusColor;
    if (!widget.isDestructive) {
      primaryColor = Colors.transparent;
      disabledColor = Colors.transparent;
      hoverColor = Colors.transparent;
      focusColor = Colors.transparent;
    } else {
      primaryColor = Colors.transparent;
      disabledColor = Colors.transparent;
      hoverColor = Colors.transparent;
      focusColor = Colors.transparent;
    }

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
