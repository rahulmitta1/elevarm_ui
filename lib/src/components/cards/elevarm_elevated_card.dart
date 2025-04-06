import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmElevatedCard extends StatelessWidget {
  /// The card's contet padding.
  final EdgeInsetsGeometry? padding;

  /// Card content widget.
  final Widget child;

  const ElevarmElevatedCard({
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ElevarmColors.neutral50,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
        boxShadow: ElevarmBoxShadow.sm,
      ),
      padding: padding,
      child: child,
    );
  }
}
