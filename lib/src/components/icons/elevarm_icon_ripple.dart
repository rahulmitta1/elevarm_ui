// ignore_for_file: deprecated_member_use_from_same_package

import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// [ElevarmIconRipple] variant.
enum ElevarmIconRippleVariant {
  defaultV,
  primary,
  success,
  warning,
  danger,
}

/// [ElevarmIcon] with ripple background border
class ElevarmIconRipple extends StatelessWidget {
  /// Color of background
  final Color? backgroundColor;

  /// Color of background border
  final Color? rippleColor;

  /// Filename of icon's asset
  final IconData iconAssetName;

  /// Color of icon
  final Color? iconColor;

  /// Height of container
  final double height;

  /// Width of container
  final double width;

  /// Width of background border
  final double rippleSize;

  /// Widget variant.
  final ElevarmIconRippleVariant? variant;

  const ElevarmIconRipple({
    required this.iconAssetName,
    @Deprecated('Use variant instead if possible.') this.backgroundColor,
    @Deprecated('Use variant instead if possible.') this.rippleColor,
    @Deprecated('Use variant instead if possible.') this.iconColor,
    this.height = 48,
    this.width = 48,
    this.rippleSize = 8,
    this.variant,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late Color finalRippleColor;
    late Color finalBackgroundColor;
    late Color finalIconColor;
    if (variant == null) {
      finalRippleColor = rippleColor!;
      finalBackgroundColor = backgroundColor!;
      finalIconColor = iconColor!;
    } else {
      switch (variant!) {
        case ElevarmIconRippleVariant.defaultV:
          finalRippleColor = ElevarmColors.neutral50;
          finalBackgroundColor = ElevarmColors.neutral100;
          finalIconColor = ElevarmColors.neutral;
          break;
        case ElevarmIconRippleVariant.primary:
          finalRippleColor = ElevarmColors.primary100;
          finalBackgroundColor = ElevarmColors.primary200;
          finalIconColor = ElevarmColors.primary;
          break;
        case ElevarmIconRippleVariant.success:
          finalRippleColor = ElevarmColors.success100;
          finalBackgroundColor = ElevarmColors.success200;
          finalIconColor = ElevarmColors.success;
          break;
        case ElevarmIconRippleVariant.warning:
          finalRippleColor = ElevarmColors.warning100;
          finalBackgroundColor = ElevarmColors.warning200;
          finalIconColor = ElevarmColors.warning600;
          break;
        case ElevarmIconRippleVariant.danger:
          finalRippleColor = ElevarmColors.danger100;
          finalBackgroundColor = ElevarmColors.danger200;
          finalIconColor = ElevarmColors.danger;
          break;
      }
    }

    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: finalBackgroundColor,
          border: Border.all(
            width: rippleSize,
            color: finalRippleColor,
          ),
        ),
        child: ElevarmIcon(
          iconAssetName,
          color: finalIconColor,
        ),
      ),
    );
  }
}
