import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [ElevarmLogo]'s variant.
enum ElevarmLogoVariant {
  black,
  colorful,
  whiteGreen,
  white,
}

/// Elevarm UI's Elevarm logo widget.
class ElevarmLogo extends StatelessWidget {
  /// The logo's height.
  final double height;

  /// The logo's width.
  final double? width;

  /// Whether to use the white font or not.
  @Deprecated(
    'Use variant property instead. Will be removed in the future release.',
  )
  final bool? isWhite;

  /// The logo's variant.
  final ElevarmLogoVariant variant;

  const ElevarmLogo({
    super.key,
    this.height = 20.0,
    this.width,
    @Deprecated(
      'Use variant property instead. Will be removed in the future release.',
    )
    this.isWhite,
    this.variant = ElevarmLogoVariant.colorful,
  });

  @override
  Widget build(BuildContext context) {
    late String assetName;
    // ignore: deprecated_member_use_from_same_package
    if (isWhite != null) {
      // ignore: deprecated_member_use_from_same_package
      assetName = !isWhite!
          ? 'packages/elevarm_ui/assets/images/elevarm_logo_colorful.svg'
          : 'packages/elevarm_ui/assets/images/elevarm_logo_white_green.svg';
    } else {
      switch (variant) {
        case ElevarmLogoVariant.black:
          assetName =
              'packages/elevarm_ui/assets/images/elevarm_logo_black.svg';
          break;
        case ElevarmLogoVariant.colorful:
          assetName =
              'packages/elevarm_ui/assets/images/elevarm_logo_colorful.svg';
          break;
        case ElevarmLogoVariant.whiteGreen:
          assetName =
              'packages/elevarm_ui/assets/images/elevarm_logo_white_green.svg';
          break;
        case ElevarmLogoVariant.white:
          assetName =
              'packages/elevarm_ui/assets/images/elevarm_logo_white.svg';
          break;
      }
    }
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
    );
  }
}
