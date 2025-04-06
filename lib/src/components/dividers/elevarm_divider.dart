import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Content Divider component widget.
class ElevarmDivider extends StatelessWidget {
  /// The divider's height extent
  final double? height;

  /// The thickness of the line drawn within the divider
  final double? thickness;

  /// The amount of empty space to the leading edge of the divider
  final double? indent;

  /// The amount of empty space to the trailing edge of the divider
  final double? endIndent;

  /// The color to use when painting the line
  final Color? color;

  /// The content widget displayed in the middle of the divider.
  final Widget? child;

  const ElevarmDivider({
    Key? key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color = ElevarmColors.neutral100,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Row(
        children: <Widget>[
          Expanded(child: _buildDivider),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: child!,
          ),
          Expanded(child: _buildDivider),
        ],
      );
    } else {
      return _buildDivider;
    }
  }

  /// Builds a single [Divider].
  Widget get _buildDivider {
    return Divider(
      key: key,
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      color: color,
    );
  }
}
