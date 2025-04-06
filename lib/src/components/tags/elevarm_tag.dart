import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// [ElevarmTag]'s possible sizes
enum ElevarmTagSize {
  sm,
  md,
  lg,
}

/// [ElevarmTag]'s possible trailing types.
enum ElevarmTagTrailing {
  /// Close icon.
  closeIcon,

  /// Count.
  count,
}

class ElevarmTag extends StatelessWidget {
  /// Tag's text.
  final String text;

  /// Tag's leading widget.
  final Widget? leading;

  /// Callback when the tag is tapped.
  final VoidCallback? onTap;

  /// Tag's size.
  final ElevarmTagSize size;

  /// Tag's trailing type.
  final ElevarmTagTrailing? trailing;

  /// Tag's count. Displayed if [trailing] is [ElevarmTagTrailing.count].
  final int count;

  /// If true, displays checkbox inside the tag.
  final bool showCheckbox;

  /// The checkbox value. Used when [showCheckbox] is true.
  final bool checkboxValue;

  /// Set this true when avatar is displayed to make sure the padding
  /// is correct.
  final bool showAvatar;

  /// Set this true when dot is displayed to make sure the padding
  /// is correct.
  final bool showDot;

  const ElevarmTag({
    required this.text,
    this.leading,
    this.onTap,
    this.size = ElevarmTagSize.md,
    this.trailing,
    this.count = 0,
    this.showCheckbox = false,
    this.checkboxValue = false,
    this.showAvatar = false,
    this.showDot = false,
    super.key,
  });

  factory ElevarmTag.dot({
    required String text,
    Color dotColor = ElevarmColors.success,
    VoidCallback? onTap,
    ElevarmTagSize size = ElevarmTagSize.md,
    ElevarmTagTrailing? trailing,
    int count = 0,
    bool showCheckbox = false,
    bool checkboxValue = false,
  }) {
    return ElevarmTag(
      onTap: onTap,
      size: size,
      trailing: trailing,
      count: count,
      showCheckbox: showCheckbox,
      checkboxValue: checkboxValue,
      showDot: true,
      text: text,
      leading: Container(
        width: 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: dotColor,
        ),
      ),
    );
  }

  factory ElevarmTag.avatar({
    required String text,
    VoidCallback? onTap,
    ElevarmTagSize size = ElevarmTagSize.md,
    ElevarmTagTrailing? trailing,
    int count = 0,
    bool showCheckbox = false,
    bool checkboxValue = false,
    Color avatarBackgroundColor = ElevarmColors.neutral100,
    bool avatarShowVerifiedTick = false,
    double? avatarVerifiedTickSize,
    bool avatarShowOnlineIndicator = false,
    double avatarOnlineIndicatorBorderWidth = 1.5,
    Color avatarOnlineIndicatorBorderColor = ElevarmColors.white,
    Color avatarOnlineIndicatorColor = ElevarmColors.success,
    double? avatarOnlineIndicatorSize,
    ImageProvider<Object>? avatarImage,
    String? avatarInitial,
    IconData avatarEmptyIconAssetName = ElevarmIconsOutline.user_01,
    Color avatarEmptyIconColor = ElevarmColors.neutral400,
    double? avatarEmptyIconSize,
    FontWeight avatarInitialFontWeight = ElevarmFontWeights.medium,
    Color avatarInitialFontColor = ElevarmColors.neutral400,
    double? avatarInitialFontSize,
  }) {
    return ElevarmTag(
      onTap: onTap,
      size: size,
      trailing: trailing,
      count: count,
      showCheckbox: showCheckbox,
      checkboxValue: checkboxValue,
      showAvatar: true,
      text: text,
      leading: ElevarmAvatar(
        size: 16.0,
        backgroundColor: avatarBackgroundColor,
        showVerifiedTick: avatarShowVerifiedTick,
        verifiedTickSize: avatarVerifiedTickSize,
        showOnlineIndicator: avatarShowOnlineIndicator,
        onlineIndicatorBorderWidth: avatarOnlineIndicatorBorderWidth,
        onlineIndicatorBorderColor: avatarOnlineIndicatorBorderColor,
        onlineIndicatorColor: avatarOnlineIndicatorColor,
        onlineIndicatorSize: avatarOnlineIndicatorSize,
        image: avatarImage,
        initial: avatarInitial,
        emptyIconAssetName: avatarEmptyIconAssetName,
        emptyIconColor: avatarEmptyIconColor,
        emptyIconSize: avatarEmptyIconSize,
        initialFontWeight: avatarInitialFontWeight,
        initialFontColor: avatarInitialFontColor,
        initialFontSize: avatarInitialFontSize,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = 6.0;

    late TextStyle textStyle;

    late double leadingMargin;
    late double trailingMargin;

    late TextStyle countTextStyle;
    late double countSize;

    late double closeIconSize;

    late double checkboxMargin;
    late ElevarmCheckboxSize checkboxSize;

    switch (size) {
      case ElevarmTagSize.sm:
        textStyle = ElevarmFontFamilies.inter(
          fontSize: ElevarmFontSizes.xs,
          fontWeight: ElevarmFontWeights.medium,
          color: ElevarmColors.neutral400,
        );

        checkboxMargin = 4.0;
        checkboxSize = ElevarmCheckboxSize.sm;

        countSize = 16.0;
        countTextStyle = ElevarmFontFamilies.inter(
          fontSize: ElevarmFontSizes.xs,
          fontWeight: ElevarmFontWeights.medium,
          color: ElevarmColors.neutral400,
        );

        closeIconSize = 14.0;

        leadingMargin = 4.0;
        switch (trailing) {
          case ElevarmTagTrailing.count:
            trailingMargin = 4.0;
            break;
          case ElevarmTagTrailing.closeIcon:
          default:
            trailingMargin = 3.0;
        }
        break;
      case ElevarmTagSize.md:
        textStyle = ElevarmFontFamilies.inter(
          fontSize: ElevarmFontSizes.sm,
          fontWeight: ElevarmFontWeights.medium,
          color: ElevarmColors.neutral400,
        );

        checkboxMargin = 5.0;
        checkboxSize = ElevarmCheckboxSize.md;

        countSize = 19.0;
        countTextStyle = ElevarmFontFamilies.inter(
          fontSize: ElevarmFontSizes.xs,
          fontWeight: ElevarmFontWeights.medium,
          color: ElevarmColors.neutral400,
        );

        closeIconSize = 16.0;

        leadingMargin = 5.0;
        switch (trailing) {
          case ElevarmTagTrailing.count:
            trailingMargin = 5.0;
            break;
          case ElevarmTagTrailing.closeIcon:
          default:
            trailingMargin = 3.0;
        }
        break;
      case ElevarmTagSize.lg:
        textStyle = ElevarmFontFamilies.inter(
          fontSize: ElevarmFontSizes.sm,
          fontWeight: ElevarmFontWeights.medium,
          color: ElevarmColors.neutral400,
        );

        checkboxMargin = 6.0;
        checkboxSize = ElevarmCheckboxSize.md; // TODO: lg in Figma

        countSize = 21.0;
        countTextStyle = ElevarmFontFamilies.inter(
          fontSize: ElevarmFontSizes.sm,
          fontWeight: ElevarmFontWeights.medium,
          color: ElevarmColors.neutral400,
        );

        closeIconSize = 20.0;

        leadingMargin = 6.0;
        switch (trailing) {
          case ElevarmTagTrailing.count:
            trailingMargin = 6.0;
            break;
          case ElevarmTagTrailing.closeIcon:
          default:
            trailingMargin = 3.0;
        }
        break;
    }

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Material(
        color: ElevarmColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: _getContentPadding(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: ElevarmColors.neutral100,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                if (showCheckbox) ...[
                  ElevarmCheckbox(
                    size: checkboxSize,
                    checked: checkboxValue,
                    onPressed: onTap,
                  ),
                  SizedBox(width: checkboxMargin),
                ],
                Row(
                  children: [
                    if (leading != null) ...[
                      leading!,
                      SizedBox(width: leadingMargin),
                    ],
                    Text(
                      text,
                      style: textStyle,
                    ),
                  ],
                ),
                if (trailing != null) ...[
                  SizedBox(width: trailingMargin),
                  _buildTrailing(
                    trailing!,
                    countSize,
                    closeIconSize,
                    countTextStyle,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets _getContentPadding() {
    late EdgeInsets contentPadding;
    switch (size) {
      case ElevarmTagSize.sm:
        double contentPaddingLeft = 8.0;
        if (showCheckbox) {
          contentPaddingLeft = 5.0;
        } else {
          if (showAvatar) {
            contentPaddingLeft = 4.0;
          } else if (showDot) {
            contentPaddingLeft = 6.0;
          }
        }
        double contentPaddingRight = 8.0;
        if (trailing == ElevarmTagTrailing.closeIcon) {
          contentPaddingRight = 4.0;
        } else if (trailing == ElevarmTagTrailing.count) {
          contentPaddingRight = 4.0;
        }
        contentPadding = EdgeInsets.only(
          top: 3.0,
          bottom: 3.0,
          right: contentPaddingRight,
          left: contentPaddingLeft,
        );
        break;
      case ElevarmTagSize.md:
        double contentPaddingLeft = 9.0;
        if (showCheckbox) {
          contentPaddingLeft = 4.0;
        } else {
          if (showAvatar) {
            contentPaddingLeft = 5.0;
          } else if (showDot) {
            contentPaddingLeft = 7.0;
          }
        }
        double contentPaddingRight = 9.0;
        if (trailing == ElevarmTagTrailing.closeIcon) {
          contentPaddingRight = 4.0;
        } else if (trailing == ElevarmTagTrailing.count) {
          contentPaddingRight = 3.0;
        }
        contentPadding = EdgeInsets.only(
          top: 2.0,
          bottom: 2.0,
          right: contentPaddingRight,
          left: contentPaddingLeft,
        );
        break;
      case ElevarmTagSize.lg:
        double contentPaddingLeft = 10.0;
        if (showCheckbox) {
          contentPaddingLeft = 5.0;
        } else {
          if (showAvatar) {
            contentPaddingLeft = 7.0;
          } else if (showDot) {
            contentPaddingLeft = 9.0;
          }
        }
        double contentPaddingRight = 10.0;
        if (trailing == ElevarmTagTrailing.closeIcon) {
          contentPaddingRight = 4.0;
        } else if (trailing == ElevarmTagTrailing.count) {
          contentPaddingRight = 4.0;
        }
        contentPadding = EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
          right: contentPaddingRight,
          left: contentPaddingLeft,
        );
        break;
    }
    return contentPadding;
  }

  Widget _buildTrailing(
    ElevarmTagTrailing trailing,
    double countSize,
    double closeIconSize,
    TextStyle countTextStyle,
  ) {
    switch (trailing) {
      case ElevarmTagTrailing.closeIcon:
        return ElevarmIcon(
          ElevarmIconsOutline.x_close,
          size: closeIconSize,
        );
      case ElevarmTagTrailing.count:
        return Container(
          width: countSize,
          height: countSize,
          decoration: BoxDecoration(
            color: ElevarmColors.neutral100,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Center(
            child: Text(
              count.toString(),
              style: countTextStyle,
            ),
          ),
        );
    }
  }
}
