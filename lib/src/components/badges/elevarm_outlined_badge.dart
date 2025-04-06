import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/components/badges/elevarm_base_badge.dart';
import 'package:flutter/material.dart';

/// Elevarm's outlined badge widget.
class ElevarmOutlinedBadge extends StatelessWidget {
  /// The badge's content.
  final Widget child;

  /// The badge's size.
  final ElevarmBadgeSize size;

  /// The badge's variant.
  final ElevarmBadgeVariant variant;

  /// The border width.
  final double borderWidth;

  /// The content padding.
  final EdgeInsetsGeometry? contentPadding;

  /// Callback when the badge is tapped.
  final VoidCallback? onTap;

  const ElevarmOutlinedBadge({
    required this.child,
    this.size = ElevarmBadgeSize.md,
    this.variant = ElevarmBadgeVariant.defaultV,
    this.borderWidth = 1.5,
    this.contentPadding,
    this.onTap,
    super.key,
  });

  /// Creates [ElevarmOutlinedBadge] with only [text] as a content.
  factory ElevarmOutlinedBadge.text(
    String text, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    VoidCallback? onTap,
    double borderWidth = 1.5,
  }) {
    EdgeInsetsGeometry contentPadding;
    double fontSize;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = EdgeInsets.symmetric(
          vertical: 2.0 - borderWidth,
          horizontal: 8.0 - borderWidth,
        );
        fontSize = ElevarmFontSizes.xs;
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = EdgeInsets.symmetric(
          vertical: 4.0 - borderWidth,
          horizontal: 12.0 - borderWidth,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = EdgeInsets.symmetric(
          vertical: 2.0 - borderWidth,
          horizontal: 10.0 - borderWidth,
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
        textColor = ElevarmColors.neutral400;
        break;
    }
    return ElevarmOutlinedBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      borderWidth: borderWidth,
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

  /// Creates [ElevarmOutlinedBadge] with [text] and a leading dot as content.
  factory ElevarmOutlinedBadge.dot(
    String text, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    VoidCallback? onTap,
    double borderWidth = 1.5,
  }) {
    EdgeInsetsGeometry contentPadding;
    double fontSize;
    double dotMargin;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = EdgeInsets.only(
          top: 2.0 - borderWidth,
          bottom: 2.0 - borderWidth,
          right: 8.0 - borderWidth,
          left: 7.0 - borderWidth,
        );
        fontSize = ElevarmFontSizes.xs;
        dotMargin = 5.0;
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = EdgeInsets.only(
          top: 4.0 - borderWidth,
          bottom: 4.0 - borderWidth,
          right: 12.0 - borderWidth,
          left: 11.0 - borderWidth,
        );
        fontSize = ElevarmFontSizes.sm;
        dotMargin = 7.0;
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = EdgeInsets.only(
          top: 2.0 - borderWidth,
          bottom: 2.0 - borderWidth,
          right: 10.0 - borderWidth,
          left: 9.0 - borderWidth,
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
        dotColor = ElevarmColors.danger600;
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
        textColor = ElevarmColors.neutral400;
        dotColor = ElevarmColors.neutral400;
        break;
    }
    return ElevarmOutlinedBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      borderWidth: borderWidth,
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

  /// Creates [ElevarmOutlinedBadge] with [text] and a leading [ElevarmAvatar]
  /// as content.
  factory ElevarmOutlinedBadge.avatar(
    String text,
    ElevarmAvatar avatar, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    VoidCallback? onTap,
    double borderWidth = 1.5,
  }) {
    EdgeInsetsGeometry contentPadding;
    double fontSize;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = EdgeInsets.only(
          top: 2.0 - borderWidth,
          bottom: 2.0 - borderWidth,
          right: 8.0 - borderWidth,
          left: 3.0 - borderWidth,
        );
        fontSize = ElevarmFontSizes.xs;
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = EdgeInsets.only(
          top: 4.0 - borderWidth,
          bottom: 4.0 - borderWidth,
          right: 12.0 - borderWidth,
          left: 6.0 - borderWidth,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = EdgeInsets.only(
          top: 2.0 - borderWidth,
          bottom: 2.0 - borderWidth,
          right: 10.0 - borderWidth,
          left: 4.0 - borderWidth,
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
        textColor = ElevarmColors.neutral400;
        break;
    }
    return ElevarmOutlinedBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      borderWidth: borderWidth,
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

  /// Creates [ElevarmOutlinedBadge] with [text] and a trailing cancel icon
  /// as content.
  factory ElevarmOutlinedBadge.cancel(
    String text, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    IconData cancelIconAssetName = ElevarmIconsOutline.x_close,
    double borderWidth = 1.5,
    VoidCallback? onTap,
  }) {
    EdgeInsetsGeometry contentPadding;
    double fontSize;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = EdgeInsets.only(
          top: 2.0 - borderWidth,
          bottom: 2.0 - borderWidth,
          right: 5.0 - borderWidth,
          left: 8.0 - borderWidth,
        );
        fontSize = ElevarmFontSizes.xs;
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = EdgeInsets.only(
          top: 4.0 - borderWidth,
          bottom: 4.0 - borderWidth,
          right: 10.0 - borderWidth,
          left: 12.0 - borderWidth,
        );
        fontSize = ElevarmFontSizes.sm;
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = EdgeInsets.only(
          top: 2.0 - borderWidth,
          bottom: 2.0 - borderWidth,
          right: 8.0 - borderWidth,
          left: 10.0 - borderWidth,
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
        iconColor = ElevarmColors.danger600;
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
        textColor = ElevarmColors.neutral400;
        iconColor = ElevarmColors.neutral400;
        break;
    }
    return ElevarmOutlinedBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      borderWidth: borderWidth,
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

  /// Creates [ElevarmOutlinedBadge] with only an icon as content.
  factory ElevarmOutlinedBadge.iconOnly(
    IconData iconAssetName, {
    ElevarmBadgeSize size = ElevarmBadgeSize.md,
    ElevarmBadgeVariant variant = ElevarmBadgeVariant.defaultV,
    VoidCallback? onTap,
    double borderWidth = 1.5,
  }) {
    EdgeInsetsGeometry contentPadding;
    switch (size) {
      case ElevarmBadgeSize.sm:
        contentPadding = EdgeInsets.all(4.0 - borderWidth);
        break;
      case ElevarmBadgeSize.lg:
        contentPadding = EdgeInsets.all(8.0 - borderWidth);
        break;
      case ElevarmBadgeSize.md:
      default:
        contentPadding = EdgeInsets.all(6.0 - borderWidth);
        break;
    }
    Color iconColor;
    switch (variant) {
      case ElevarmBadgeVariant.primary:
        iconColor = ElevarmColors.primary500;
        break;
      case ElevarmBadgeVariant.danger:
        iconColor = ElevarmColors.danger600;
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
    return ElevarmOutlinedBadge(
      size: size,
      variant: variant,
      contentPadding: contentPadding,
      onTap: onTap,
      borderWidth: borderWidth,
      child: ElevarmIcon(
        iconAssetName,
        size: 12.0,
        color: iconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    switch (variant) {
      case ElevarmBadgeVariant.primary:
        borderColor = ElevarmColors.primary;
        break;
      case ElevarmBadgeVariant.danger:
        borderColor = ElevarmColors.danger600;
        break;
      case ElevarmBadgeVariant.warning:
        borderColor = ElevarmColors.warning;
        break;
      case ElevarmBadgeVariant.success:
        borderColor = ElevarmColors.success;
        break;
      case ElevarmBadgeVariant.info:
        borderColor = ElevarmColors.info;
        break;
      case ElevarmBadgeVariant.defaultV:
      default:
        borderColor = ElevarmColors.neutral100;
        break;
    }

    return ElevarmBaseBadge(
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
      onTap: onTap,
      child: child,
    );
  }
}
