import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Base widget for badge widget.
class ElevarmBaseBadge extends StatelessWidget {
  /// The badge content.
  final Widget child;

  /// The container content padding.
  final EdgeInsetsGeometry contentPadding;

  /// Container border radius.
  final double borderRadius;

  /// The container background color.
  final Color? backgroundColor;

  /// The container border.
  final Border? border;

  /// Callback when the badge is tapped.
  final VoidCallback? onTap;

  const ElevarmBaseBadge({
    required this.child,
    required this.contentPadding,
    this.borderRadius = ElevarmBorderRadius.lg,
    this.backgroundColor,
    this.border,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: contentPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: border,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
