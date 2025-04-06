import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

enum ElevarmFilledIconVariant {
  defaultV,
  primary,
  info,
  success,
  warning,
  danger,
}

class ElevarmFilledIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final ElevarmFilledIconVariant variant;
  final EdgeInsetsGeometry padding;
  final BoxFit fit;

  const ElevarmFilledIcon({
    required this.icon,
    this.iconSize = 20.0,
    this.variant = ElevarmFilledIconVariant.defaultV,
    this.padding = const EdgeInsets.all(12.0),
    this.fit = BoxFit.scaleDown,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = _getIconColor(variant);
    Color containerColor = _getContainerColor(variant);
    return FittedBox(
      fit: fit,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: containerColor,
        ),
        child: Padding(
          padding: padding,
          child: ElevarmIcon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  Color _getIconColor(ElevarmFilledIconVariant variant) {
    switch (variant) {
      case ElevarmFilledIconVariant.defaultV:
        return ElevarmColors.neutral;
      case ElevarmFilledIconVariant.primary:
        return ElevarmColors.primary;
      case ElevarmFilledIconVariant.info:
        return ElevarmColors.info;
      case ElevarmFilledIconVariant.success:
        return ElevarmColors.success;
      case ElevarmFilledIconVariant.warning:
        return ElevarmColors.warning600;
      case ElevarmFilledIconVariant.danger:
        return ElevarmColors.danger;
    }
  }

  Color _getContainerColor(ElevarmFilledIconVariant variant) {
    switch (variant) {
      case ElevarmFilledIconVariant.defaultV:
        return ElevarmColors.neutral50;
      case ElevarmFilledIconVariant.primary:
        return ElevarmColors.primary100;
      case ElevarmFilledIconVariant.info:
        return ElevarmColors.info100;
      case ElevarmFilledIconVariant.success:
        return ElevarmColors.success100;
      case ElevarmFilledIconVariant.warning:
        return ElevarmColors.warning100;
      case ElevarmFilledIconVariant.danger:
        return ElevarmColors.danger100;
    }
  }
}
