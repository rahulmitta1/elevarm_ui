import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmPrimaryCard extends StatelessWidget {
  /// The card's contet padding.
  final EdgeInsetsGeometry? padding;

  /// Card content widget.
  final Widget child;

  const ElevarmPrimaryCard({
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ElevarmColors.primary100,
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
      ),
      padding: padding,
      child: child,
    );
  }
}
