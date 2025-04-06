import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Possible size values for checkbox.
enum ElevarmCheckboxSize {
  /// Small (SM) checkbox size.
  sm,

  /// Medium (MD) checkbox size.
  md,
}

/// Elevarm UI's Checkbox component widget.
class ElevarmCheckbox extends StatefulWidget {
  /// Whether the checkbox is checked.
  final bool checked;

  /// Whether the checkbox is indeterminate. Make sure to set [checked] as well
  /// to use this property.
  final bool indeterminate;

  /// Checkbox's size.
  final ElevarmCheckboxSize size;

  /// Checkbox supporting title if any.
  final String? title;

  /// Checkbox supporting subtitle if any.
  final String? subtitle;

  /// Callback when checkbox is pressed. Set this value to null to disable
  /// the checkbox.
  final VoidCallback? onPressed;

  /// Theme for checkbox styling.
  final ElevarmCheckboxThemeData checkboxThemeData;

  const ElevarmCheckbox({
    required this.checked,
    required this.onPressed,
    this.indeterminate = false,
    this.size = ElevarmCheckboxSize.md,
    this.title,
    this.subtitle,
    this.checkboxThemeData = const ElevarmCheckboxThemeData(),
    super.key,
  });

  @override
  State<ElevarmCheckbox> createState() => _ElevarmCheckboxState();
}

class _ElevarmCheckboxState extends State<ElevarmCheckbox> {
  /// Whether currently the checkbox is focused.
  bool _isFocused = false;

  /// Whether currently the checkbox is hovered.
  bool _isHovered = false;

  /// Theme for checkbox styling.
  late ElevarmCheckboxThemeData checkboxThemeData;

  @override
  Widget build(BuildContext context) {
    checkboxThemeData = ElevarmCheckboxTheme.of(context)?.checkboxThemeData ??
        widget.checkboxThemeData;

    if (widget.title == null && widget.subtitle == null) {
      return _buildCheckbox(context);
    } else {
      return _buildCheckboxWithTexts(context);
    }
  }

  /// Builds the checkbox widget.
  Widget _buildCheckbox(BuildContext context) {
    double checkboxSize;
    double checkboxBorderRadius;
    double checkboxIconSize;
    switch (widget.size) {
      case ElevarmCheckboxSize.sm:
        checkboxSize = 16.0;
        checkboxBorderRadius = 4.0;
        checkboxIconSize = 12.0;
        break;
      case ElevarmCheckboxSize.md:
      default:
        checkboxSize = 20.0;
        checkboxBorderRadius = 6.0;
        checkboxIconSize = 14.0;
        break;
    }
    Color checkboxBorderColor;
    if (widget.onPressed != null) {
      if (widget.checked || widget.indeterminate || _isHovered) {
        checkboxBorderColor = checkboxThemeData.borderCheckedColor;
      } else {
        if (_isFocused) {
          checkboxBorderColor = checkboxThemeData.borderFocusedColor;
        } else {
          checkboxBorderColor = checkboxThemeData.borderColor;
        }
      }
    } else {
      checkboxBorderColor = checkboxThemeData.borderDisabledColor;
    }

    Color checkboxBackgroundColor;
    if (widget.onPressed != null) {
      if (widget.checked || widget.indeterminate || _isHovered) {
        checkboxBackgroundColor = checkboxThemeData.backgroundCheckedColor;
      } else {
        checkboxBackgroundColor = checkboxThemeData.backgroundColor;
      }
    } else {
      checkboxBackgroundColor = checkboxThemeData.backgroundDisabledColor;
    }

    List<BoxShadow>? checkboxBoxShadow;
    if (widget.onPressed != null && _isFocused) {
      checkboxBoxShadow = const [
        BoxShadow(
          color: Color(0xFFEBF1FF),
          offset: Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 4.0,
        ),
      ];
    }

    Color checkboxIconColor;
    if (widget.onPressed != null) {
      checkboxIconColor = checkboxThemeData.iconEnabledColor;
    } else {
      checkboxIconColor = checkboxThemeData.iconDisabledColor;
    }

    Widget? child;
    if (widget.checked) {
      if (!widget.indeterminate) {
        child = ElevarmIcon(
          ElevarmIconsOutline.check,
          size: checkboxIconSize,
          color: checkboxIconColor,
        );
      } else {
        child = ElevarmIcon(
          ElevarmIconsOutline.minus,
          size: checkboxIconSize,
          color: checkboxIconColor,
        );
      }
    }

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: checkboxBoxShadow,
          borderRadius: BorderRadius.circular(checkboxBorderRadius),
        ),
        child: Material(
          color: checkboxBackgroundColor,
          borderRadius: BorderRadius.circular(checkboxBorderRadius),
          child: InkWell(
            onTap: widget.onPressed,
            onFocusChange: (value) {
              setState(() {
                _isFocused = value;
              });
            },
            focusColor: ElevarmColors.white,
            onHover: (value) {
              setState(() {
                _isHovered = value;
              });
            },
            hoverColor: ElevarmColors.primary100,
            borderRadius: BorderRadius.circular(checkboxBorderRadius),
            child: Container(
              width: checkboxSize,
              height: checkboxSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(checkboxBorderRadius),
                border: Border.all(
                  color: checkboxBorderColor,
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the checkbox widget with supporting texts.
  Widget _buildCheckboxWithTexts(BuildContext context) {
    double fontSize;
    switch (widget.size) {
      case ElevarmCheckboxSize.sm:
        fontSize = ElevarmFontSizes.sm;
        break;
      case ElevarmCheckboxSize.md:
      default:
        fontSize = ElevarmFontSizes.md;
        break;
    }

    return GestureDetector(
      onTap: widget.onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCheckbox(context),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title!,
                  style: ElevarmFontFamilies.inter(
                    color: ElevarmColors.neutral,
                    fontSize: fontSize,
                    fontWeight: ElevarmFontWeights.medium,
                  ),
                ),
                widget.subtitle != null
                    ? Text(
                        widget.subtitle!,
                        style: ElevarmFontFamilies.inter(
                          color: ElevarmColors.neutral300,
                          fontSize: fontSize,
                          fontWeight: ElevarmFontWeights.regular,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
