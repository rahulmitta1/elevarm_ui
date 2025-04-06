import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Tertiary Neutral Button component widget.
class ElevarmTertiaryNeutralButton extends StatefulWidget {
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

  const ElevarmTertiaryNeutralButton({
    required this.builder,
    required this.onPressed,
    this.height = ElevarmButtonHeights.md,
    this.contentPadding,
    this.isDestructive = false,
    super.key,
  });

  @override
  State<ElevarmTertiaryNeutralButton> createState() =>
      _ElevarmTertiaryNeutralButtonState();

  /// Creates [ElevarmTertiaryNeutralButton] with only text as content.
  factory ElevarmTertiaryNeutralButton.text({
    required String text,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    Key? key,
  }) {
    return ElevarmTertiaryNeutralButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      builder: (context, isFocused, isHovered) {
        Color textColor;
        if (!isDestructive) {
          if (!isHovered) {
            textColor = onPressed != null
                ? ElevarmColors.neutral500
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
            fontSize: ElevarmButtonTextFontSize.fromButtonHeights(height),
            fontWeight: ElevarmFontWeights.semibold,
          ),
        );
      },
    );
  }

  /// Creates [ElevarmTertiaryNeutralButton] with text and icon(s) (leading and/or trailing)
  /// as content.
  factory ElevarmTertiaryNeutralButton.icon({
    required String text,
    required IconData? leadingIconAssetName,
    required IconData? trailingIconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    Key? key,
  }) {
    return ElevarmTertiaryNeutralButton(
      key: key,
      height: height,
      onPressed: onPressed,
      isDestructive: isDestructive,
      builder: (context, isFocused, isHovered) {
        Color textColor;
        if (!isDestructive) {
          if (!isHovered) {
            textColor = onPressed != null
                ? ElevarmColors.neutral500
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

  /// Creates [ElevarmTertiaryNeutralButton] with only an icon as content.
  factory ElevarmTertiaryNeutralButton.iconOnly({
    required IconData iconAssetName,
    double height = ElevarmButtonHeights.md,
    VoidCallback? onPressed,
    bool isDestructive = false,
    Key? key,
  }) {
    return ElevarmTertiaryNeutralButton(
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
                ? ElevarmColors.neutral500
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
}

class _ElevarmTertiaryNeutralButtonState
    extends State<ElevarmTertiaryNeutralButton> {
  /// Whether currently the button is focused.
  bool _isFocused = false;

  /// Whether currently the button is hovered.
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    late Color hoverColor;
    late Color focusColor;
    if (!widget.isDestructive) {
      hoverColor = ElevarmColors.neutral100;
      focusColor = Colors.transparent;
    } else {
      hoverColor = ElevarmColors.danger100;
      focusColor = Colors.transparent;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ElevarmBorderRadius.sm,
        ),
      ),
      child: Material(
        color: Colors.transparent,
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
