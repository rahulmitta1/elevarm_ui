import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElevarmAvatarSizes {
  static const double xs = 24.0;
  static const double sm = 32.0;
  static const double md = 40.0;
  static const double lg = 48.0;
  static const double xl = 56.0;
  static const double xl2 = 64.0;
}

class _ElevarmAvatarOnlineIndicatorSizes {
  static const double xs = 6.0;
  static const double sm = 8.0;
  static const double md = 10.0;
  static const double lg = 12.0;
  static const double xl = 14.0;
  static const double xl2 = 16.0;

  static double fromAvatarSize(double avatarSizes) {
    if (avatarSizes <= ElevarmAvatarSizes.xs) {
      return xs;
    } else if (avatarSizes <= ElevarmAvatarSizes.sm) {
      return sm;
    } else if (avatarSizes <= ElevarmAvatarSizes.md) {
      return md;
    } else if (avatarSizes <= ElevarmAvatarSizes.lg) {
      return lg;
    } else if (avatarSizes <= ElevarmAvatarSizes.xl) {
      return xl;
    } else {
      return xl2;
    }
  }
}

class _ElevarmAvatarIconSizes {
  static const double xs = 16.0;
  static const double sm = 20.0;
  static const double md = 24.0;
  static const double lg = 28.0;
  static const double xl = 32.0;
  static const double xl2 = 32.0;

  static double fromAvatarSize(double avatarSizes) {
    if (avatarSizes <= ElevarmAvatarSizes.xs) {
      return xs;
    } else if (avatarSizes <= ElevarmAvatarSizes.sm) {
      return sm;
    } else if (avatarSizes <= ElevarmAvatarSizes.md) {
      return md;
    } else if (avatarSizes <= ElevarmAvatarSizes.lg) {
      return lg;
    } else if (avatarSizes <= ElevarmAvatarSizes.xl) {
      return xl;
    } else {
      return xl2;
    }
  }
}

class _ElevarmAvatarVerifiedIconSizes {
  static const double xs = 10.0;
  static const double sm = 12.0;
  static const double md = 14.0;
  static const double lg = 16.0;
  static const double xl = 18.0;
  static const double xl2 = 20.0;

  static double fromAvatarSize(double avatarSizes) {
    if (avatarSizes <= ElevarmAvatarSizes.xs) {
      return xs;
    } else if (avatarSizes <= ElevarmAvatarSizes.sm) {
      return sm;
    } else if (avatarSizes <= ElevarmAvatarSizes.md) {
      return md;
    } else if (avatarSizes <= ElevarmAvatarSizes.lg) {
      return lg;
    } else if (avatarSizes <= ElevarmAvatarSizes.xl) {
      return xl;
    } else {
      return xl2;
    }
  }
}

class _ElevarmAvatarInitialFontSizes {
  static const double xs = ElevarmFontSizes.xs;
  static const double sm = ElevarmFontSizes.sm;
  static const double md = ElevarmFontSizes.md;
  static const double lg = ElevarmFontSizes.lg;
  static const double xl = ElevarmFontSizes.xl;
  static const double xl2 = ElevarmFontSizes.xl2;

  static double fromAvatarSize(double avatarSizes) {
    if (avatarSizes <= ElevarmAvatarSizes.xs) {
      return xs;
    } else if (avatarSizes <= ElevarmAvatarSizes.sm) {
      return sm;
    } else if (avatarSizes <= ElevarmAvatarSizes.md) {
      return md;
    } else if (avatarSizes <= ElevarmAvatarSizes.lg) {
      return lg;
    } else if (avatarSizes <= ElevarmAvatarSizes.xl) {
      return xl;
    } else {
      return xl2;
    }
  }
}

class ElevarmAvatar extends StatelessWidget {
  /// The size of the circle container. Use [ElevarmAvatarSizes] values.
  final double size;

  /// The background color of the circle container.
  final Color backgroundColor;

  /// The image shown in the avatar.
  final ImageProvider? image;

  /// The initial text shown in the avatar. If [image] is present,
  /// this property won't be used.
  final String? initial;

  /// The initial text’s font weight.
  final FontWeight initialFontWeight;

  /// The initial text’s font color.
  final Color initialFontColor;

  /// The initial text’s font size.
  final double? initialFontSize;

  /// The empty icon asset name.
  final IconData emptyIconAssetName;

  /// The empty icon asset name.
  final Color emptyIconColor;

  /// The empty icon size.
  final double? emptyIconSize;

  /// Whether to show online indicator.
  final bool showOnlineIndicator;

  /// Online indicator border width.
  final double onlineIndicatorBorderWidth;

  /// Online indicator border width.
  final Color onlineIndicatorBorderColor;

  /// Online indicator border color.
  final Color onlineIndicatorColor;

  /// Online indicator size.
  final double? onlineIndicatorSize;

  /// Whether to show verified tick.
  final bool showVerifiedTick;

  /// Verified tick size.
  final double? verifiedTickSize;

  const ElevarmAvatar({
    super.key,
    this.size = ElevarmAvatarSizes.md,
    this.backgroundColor = ElevarmColors.neutral100,
    this.showVerifiedTick = false,
    this.verifiedTickSize,
    this.showOnlineIndicator = false,
    this.onlineIndicatorBorderWidth = 1.5,
    this.onlineIndicatorBorderColor = ElevarmColors.white,
    this.onlineIndicatorColor = ElevarmColors.success,
    this.onlineIndicatorSize,
    this.image,
    this.initial,
    this.emptyIconAssetName = ElevarmIconsOutline.user_01,
    this.emptyIconColor = ElevarmColors.neutral400,
    this.emptyIconSize,
    this.initialFontWeight = ElevarmFontWeights.medium,
    this.initialFontColor = ElevarmColors.neutral400,
    this.initialFontSize,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    DecorationImage? decorationImage;
    if (image != null) {
      decorationImage = DecorationImage(
        image: image!,
        fit: BoxFit.cover,
      );
    } else if (initial != null) {
      child = Text(
        initial!,
        style: ElevarmFontFamilies.inter(
          fontWeight: initialFontWeight,
          fontSize: initialFontSize ??
              _ElevarmAvatarInitialFontSizes.fromAvatarSize(size),
          color: initialFontColor,
        ),
      );
    } else {
      child = ElevarmIcon(
        emptyIconAssetName,
        size: emptyIconSize ?? _ElevarmAvatarIconSizes.fromAvatarSize(size),
        color: emptyIconColor,
      );
    }

    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            image: decorationImage,
          ),
          child: Center(
            child: child,
          ),
        ),
        showOnlineIndicator && !showVerifiedTick
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: onlineIndicatorSize ??
                      _ElevarmAvatarOnlineIndicatorSizes.fromAvatarSize(size),
                  height: onlineIndicatorSize ??
                      _ElevarmAvatarOnlineIndicatorSizes.fromAvatarSize(size),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: onlineIndicatorColor,
                    border: Border.all(
                      color: onlineIndicatorBorderColor,
                      width: onlineIndicatorBorderWidth,
                    ),
                  ),
                ),
              )
            : Container(),
        showVerifiedTick
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: SvgPicture.asset(
                  'packages/elevarm_ui/assets/icons/verified-tick.svg',
                  width: verifiedTickSize ??
                      _ElevarmAvatarVerifiedIconSizes.fromAvatarSize(size),
                  height: verifiedTickSize ??
                      _ElevarmAvatarVerifiedIconSizes.fromAvatarSize(size),
                ),
              )
            : Container(),
      ],
    );
  }
}
