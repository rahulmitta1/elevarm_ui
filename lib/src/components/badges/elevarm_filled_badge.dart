import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/components/badges/elevarm_base_badge.dart';
import 'package:flutter/material.dart';

/// Elevarm's filled badge widget.
class ElevarmFilledBadge extends StatelessWidget {
  /// The badge's content.
  final Widget child;

  /// The badge's size.
  final ElevarmBadgeSize size;

  /// The badge's variant.
  final ElevarmBadgeVariant variant;

  /// The content padding.
  final EdgeInsetsGeometry? contentPadding;

  /// Callback when the badge is tapped.
  final VoidCallback? onTap;

  const ElevarmFilledBadge({
    required this.child,
    this.size = ElevarmBadgeSize.md,
    this.variant = ElevarmBadgeVariant.defaultV,
    this.contentPadding,
    this.onTap,
    super.key,
  });

  /// Creates [ElevarmFilledBadge] with only [text] as a content.
  factory ElevarmFilledBadge.text(
    String text, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    VoidCallback? onTap,
  }) {
    EdgeInsetsGeometry contentPadding;
    double fontSize;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: 8.0,
          left: 8.0,
        );
        fontSize = ElevarmFontSizes.xs;
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
          right: 12.0,
          left: 12.0,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: 10.0,
          left: 10.0,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
    }

    Color textColor;
    switch (variant) {
      case ElevarmBadgeVariant.primary:
        textColor = ElevarmColors.primary700;
        break;
      case ElevarmBadgeVariant.danger:
        textColor = ElevarmColors.danger700;
        break;
      case ElevarmBadgeVariant.warning:
        textColor = ElevarmColors.warning700;
        break;
      case ElevarmBadgeVariant.success:
        textColor = ElevarmColors.success700;
        break;
      case ElevarmBadgeVariant.info:
        textColor = ElevarmColors.info700;
        break;
      case ElevarmBadgeVariant.defaultV:
      default:
        textColor = ElevarmColors.neutral;
        break;
    }
    return ElevarmFilledBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      child: Text(
        text,
        style: ElevarmFontFamilies.inter(
          fontWeight: ElevarmFontWeights.medium,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }

  /// Creates [ElevarmFilledBadge] with [text] and a leading dot as content.
  factory ElevarmFilledBadge.dot(
    String text, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    VoidCallback? onTap,
  }) {
    EdgeInsetsGeometry contentPadding;
    double fontSize;
    double dotMargin;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: 8.0,
          left: 7.0,
        );
        fontSize = ElevarmFontSizes.xs;
        dotMargin = 5.0;
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
          right: 12.0,
          left: 11.0,
        );
        fontSize = ElevarmFontSizes.sm;
        dotMargin = 7.0;
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: 10.0,
          left: 9.0,
        );
        fontSize = ElevarmFontSizes.sm;
        dotMargin = 7.0;
        break;
    }
    Color textColor;
    Color dotColor;
    switch (variant) {
      case ElevarmBadgeVariant.primary:
        textColor = ElevarmColors.primary700;
        dotColor = ElevarmColors.primary500;
        break;
      case ElevarmBadgeVariant.danger:
        textColor = ElevarmColors.danger700;
        dotColor = ElevarmColors.danger500;
        break;
      case ElevarmBadgeVariant.warning:
        textColor = ElevarmColors.warning700;
        dotColor = ElevarmColors.warning500;
        break;
      case ElevarmBadgeVariant.success:
        textColor = ElevarmColors.success700;
        dotColor = ElevarmColors.success500;
        break;
      case ElevarmBadgeVariant.info:
        textColor = ElevarmColors.info700;
        dotColor = ElevarmColors.info700;
        break;
      case ElevarmBadgeVariant.defaultV:
      default:
        textColor = ElevarmColors.neutral;
        dotColor = ElevarmColors.neutral400;
        break;
    }
    return ElevarmFilledBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 6.0,
            width: 6.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dotColor,
            ),
          ),
          SizedBox(width: dotMargin),
          Text(
            text,
            style: ElevarmFontFamilies.inter(
              fontWeight: ElevarmFontWeights.medium,
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Creates [ElevarmFilledBadge] with [text] and a leading [ElevarmAvatar]
  /// as content.
  factory ElevarmFilledBadge.avatar(
    String text,
    ElevarmAvatar avatar, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    VoidCallback? onTap,
  }) {
    EdgeInsetsGeometry contentPadding;
    double fontSize;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: 8.0,
          left: 3.0,
        );
        fontSize = ElevarmFontSizes.xs;
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
          right: 12.0,
          left: 6.0,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: 10.0,
          left: 4.0,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
    }
    Color textColor;
    switch (variant) {
      case ElevarmBadgeVariant.primary:
        textColor = ElevarmColors.primary700;
        break;
      case ElevarmBadgeVariant.danger:
        textColor = ElevarmColors.danger700;
        break;
      case ElevarmBadgeVariant.warning:
        textColor = ElevarmColors.warning700;
        break;
      case ElevarmBadgeVariant.success:
        textColor = ElevarmColors.success700;
        break;
      case ElevarmBadgeVariant.info:
        textColor = ElevarmColors.info700;
        break;
      case ElevarmBadgeVariant.defaultV:
      default:
        textColor = ElevarmColors.neutral;
        break;
    }
    return ElevarmFilledBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 16.0,
            width: 16.0,
            child: avatar,
          ),
          const SizedBox(width: 6.0),
          Text(
            text,
            style: ElevarmFontFamilies.inter(
              fontWeight: ElevarmFontWeights.medium,
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  /// Creates [ElevarmFilledBadge] with [text] and a trailing cancel icon
  /// as content.
  factory ElevarmFilledBadge.cancel(
    String text, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    IconData cancelIconAssetName = ElevarmIconsOutline.x_close,
    VoidCallback? onTap,
  }) {
    EdgeInsetsGeometry contentPadding;
    double fontSize;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: 5.0,
          left: 8.0,
        );
        fontSize = ElevarmFontSizes.xs;
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
          right: 10.0,
          left: 12.0,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = const EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: 8.0,
          left: 10.0,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
    }
    Color textColor;
    Color iconColor;
    switch (variant) {
      case ElevarmBadgeVariant.primary:
        textColor = ElevarmColors.primary700;
        iconColor = ElevarmColors.primary500;
        break;
      case ElevarmBadgeVariant.danger:
        textColor = ElevarmColors.danger700;
        iconColor = ElevarmColors.danger500;
        break;
      case ElevarmBadgeVariant.warning:
        textColor = ElevarmColors.warning700;
        iconColor = ElevarmColors.warning500;
        break;
      case ElevarmBadgeVariant.success:
        textColor = ElevarmColors.success700;
        iconColor = ElevarmColors.success500;
        break;
      case ElevarmBadgeVariant.info:
        textColor = ElevarmColors.info700;
        iconColor = ElevarmColors.info700;
        break;
      case ElevarmBadgeVariant.defaultV:
      default:
        textColor = ElevarmColors.neutral;
        iconColor = ElevarmColors.neutral400;
        break;
    }
    return ElevarmFilledBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text,
            style: ElevarmFontFamilies.inter(
              fontWeight: ElevarmFontWeights.medium,
              fontSize: fontSize,
              color: textColor,
            ),
          ),
          const SizedBox(width: 4.0),
          ElevarmIcon(
            cancelIconAssetName,
            size: 12.0,
            color: iconColor,
          ),
        ],
      ),
    );
  }

  /// Creates [ElevarmFilledBadge] with only an icon as content.
  factory ElevarmFilledBadge.iconOnly(
    IconData iconAssetName, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    VoidCallback? onTap,
  }) {
    EdgeInsetsGeometry contentPadding;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = const EdgeInsets.all(4.0);
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = const EdgeInsets.all(8.0);
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = const EdgeInsets.all(6.0);
        break;
    }
    Color iconColor;
    switch (variant) {
      case ElevarmBadgeVariant.primary:
        iconColor = ElevarmColors.primary500;
        break;
      case ElevarmBadgeVariant.danger:
        iconColor = ElevarmColors.danger500;
        break;
      case ElevarmBadgeVariant.warning:
        iconColor = ElevarmColors.warning500;
        break;
      case ElevarmBadgeVariant.success:
        iconColor = ElevarmColors.success500;
        break;
      case ElevarmBadgeVariant.info:
        iconColor = ElevarmColors.info700;
        break;
      case ElevarmBadgeVariant.defaultV:
      default:
        iconColor = ElevarmColors.neutral400;
        break;
    }
    return ElevarmFilledBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      child: ElevarmIcon(
        iconAssetName,
        size: 12.0,
        color: iconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    switch (variant) {
      case ElevarmBadgeVariant.primary:
        backgroundColor = ElevarmColors.primary100;
        break;
      case ElevarmBadgeVariant.danger:
        backgroundColor = ElevarmColors.danger100;
        break;
      case ElevarmBadgeVariant.warning:
        backgroundColor = ElevarmColors.warning100;
        break;
      case ElevarmBadgeVariant.success:
        backgroundColor = ElevarmColors.success100;
        break;
      case ElevarmBadgeVariant.info:
        backgroundColor = ElevarmColors.info100;
        break;
      case ElevarmBadgeVariant.defaultV:
      default:
        backgroundColor = ElevarmColors.neutral100;
        break;
    }

    return ElevarmBaseBadge(
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
      backgroundColor: backgroundColor,
      onTap: onTap,
      child: child,
    );
  }
}
