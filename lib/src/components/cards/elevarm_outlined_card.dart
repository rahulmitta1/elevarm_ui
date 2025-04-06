import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmOutlinedCard extends StatelessWidget {
  /// The card's contet padding.
  final EdgeInsetsGeometry? padding;

  /// Card content widget.
  final Widget child;

  const ElevarmOutlinedCard({
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
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
        boxShadow: ElevarmBoxShadow.xs,
      ),
      padding: padding,
      child: child,
    );
  }
}
