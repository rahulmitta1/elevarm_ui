import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Possible size values for checkbox.
enum ElevarmSwitchSize {
  /// Small (SM) checkbox size.
  sm,

  /// Medium (MD) checkbox size.
  md,
}

/// Elevarm UI's Switch component widget.
class ElevarmSwitch extends StatefulWidget {
  /// Whether the switch is turned on.
  final bool value;

  /// Callback when switch is pressed. Set this value to null to disable the
  /// switch.
  final void Function(bool?)? onChanged;

  /// Switch's size.
  final ElevarmSwitchSize size;

  /// Switch animation duration.
  final Duration duration;

  /// Switch focus node if any.
  final FocusNode? focusNode;

  /// Switch supporting title if any.
  final String? title;

  /// Switch supporting subtitle if any.
  final String? subtitle;

  const ElevarmSwitch({
    required this.value,
    this.onChanged,
    this.size = ElevarmSwitchSize.md,
    this.duration = const Duration(milliseconds: 200),
    this.focusNode,
    this.title,
    this.subtitle,
    super.key,
  });

  @override
  State<ElevarmSwitch> createState() => _ElevarmSwitchState();
}

class _ElevarmSwitchState extends State<ElevarmSwitch> {
  /// Whether currently the switch is focused.
  bool _isFocused = false;

  /// The switch focus node.
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    } else {
      _focusNode = FocusNode();
    }
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title == null && widget.subtitle == null) {
      return _buildSwitch(context);
    } else {
      return _buildSwitchWithTexts(context);
    }
  }

  /// Builds the switch widget.
  Widget _buildSwitch(BuildContext context) {
    double indicatorSize;
    if (widget.size == ElevarmSwitchSize.sm) {
      indicatorSize = 16.0;
    } else {
      indicatorSize = 20.0;
    }
    Color thumbColor;
    Color trackColor;
    Color trackHoverColor;
    if (widget.onChanged != null) {
      thumbColor = ElevarmColors.white;
      if (!widget.value) {
        trackColor = ElevarmColors.neutral100;
        trackHoverColor = ElevarmColors.neutral200;
      } else {
        trackColor = ElevarmColors.primary;
        trackHoverColor = ElevarmColors.primary700;
      }
    } else {
      thumbColor = ElevarmColors.neutral100;
      trackColor = ElevarmColors.neutral100;
      trackHoverColor = ElevarmColors.neutral100;
    }

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
          boxShadow: !_isFocused
              ? ElevarmBoxShadow.xs
              : [
                  const BoxShadow(
                    color: Color(0xFFEBF1FF),
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 4.0,
                  ),
                ],
        ),
        child: Material(
          color: trackColor,
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
          child: InkWell(
            onTap: widget.onChanged != null
                ? () {
                    widget.onChanged!(!widget.value);
                  }
                : null,
            hoverColor: trackHoverColor,
            focusColor: trackColor,
            focusNode: _focusNode,
            borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              width: indicatorSize * 2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: AnimatedAlign(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                duration: widget.duration,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: thumbColor,
                    boxShadow: ElevarmBoxShadow.sm,
                  ),
                  height: indicatorSize,
                  width: indicatorSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the switch widget with supporting texts.
  Widget _buildSwitchWithTexts(BuildContext context) {
    double fontSize;
    switch (widget.size) {
      case ElevarmSwitchSize.sm:
        fontSize = ElevarmFontSizes.sm;
        break;
      case ElevarmSwitchSize.md:
      default:
        fontSize = ElevarmFontSizes.md;
        break;
    }

    return GestureDetector(
      onTap: widget.onChanged != null
          ? () {
              widget.onChanged!(!widget.value);
            }
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSwitch(context),
          const SizedBox(width: 8.0),
          Column(
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
        ],
      ),
    );
  }
}
