import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmNeutralCard extends StatelessWidget {
  /// The card's contet padding.
  final EdgeInsetsGeometry? padding;

  /// Card content widget.
  final Widget child;

  const ElevarmNeutralCard({
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ElevarmColors.neutral100,
          width: 1,
        ),
        color: ElevarmColors.neutral50,
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
      ),
      padding: padding,
      child: child,
    );
  }
}
