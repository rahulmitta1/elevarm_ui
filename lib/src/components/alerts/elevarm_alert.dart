import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

/// [ElevarmAlert] possible sizes.
enum ElevarmAlertSize {
  mobile,
  desktop,
}

class ElevarmAlert extends StatelessWidget {
  /// The alert variant.
  final ElevarmAlertVariant variant;

  /// The alert title text.
  final String? text;

  /// The alert subtitle text.
  final String? subtitle;

  /// The callback when close alert.
  final VoidCallback? onClose;

  /// The callback of secondary action button.
  final String? secondaryActionText;

  /// The callback of secondary action button.
  final VoidCallback? onPressedSecondaryAction;

  /// The callback of primary action button.
  final String? primaryActionText;

  /// The callback of primary action button.
  final VoidCallback? onPressedPrimaryAction;

  /// The alert size.
  final ElevarmAlertSize size;

  /// The alert theme data.
  final ElevarmAlertThemeData alertThemeData;

  const ElevarmAlert({
    required this.variant,
    this.text,
    this.onClose,
    this.size = ElevarmAlertSize.mobile,
    this.alertThemeData = const ElevarmAlertThemeData(),
    this.subtitle,
    this.secondaryActionText,
    this.onPressedSecondaryAction,
    this.primaryActionText,
    this.onPressedPrimaryAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ElevarmAlertThemeData theme =
        ElevarmAlertTheme.of(context)?.alertThemeData ?? alertThemeData;

    late IconData assetNameIcon;
    late Color iconColor;
    late Color backgroundColor;
    late Color borderColor;
    late Color titleTextColor;
    late Color subtitleTextColor;
    late Color closeIconColor;
    late ElevarmLinkButtonThemeData primaryButtonTheme;
    late ElevarmLinkButtonThemeData secondaryButtonTheme;

    switch (variant) {
      case ElevarmAlertVariant.defaultV:
        assetNameIcon = Icons.info_outline; //ElevarmIconsOutline.info_circle;
        iconColor = ElevarmColors.neutral400;
        backgroundColor = ElevarmColors.white;
        borderColor = ElevarmColors.neutral100;
        titleTextColor = ElevarmColors.neutral;
        subtitleTextColor = ElevarmColors.neutral400;
        closeIconColor = ElevarmColors.neutral300;
        secondaryButtonTheme = ElevarmLinkButtonThemeData.neutral();
        primaryButtonTheme = const ElevarmLinkButtonThemeData();
        break;
      case ElevarmAlertVariant.primary:
        assetNameIcon = Icons.info_outline; //ElevarmIconsOutline.info_circle;
        iconColor = theme.iconColor;
        backgroundColor = theme.backgroundColor;
        borderColor = theme.borderColor;
        titleTextColor = theme.titleTextColor;
        subtitleTextColor = theme.subtitleTextColor;
        closeIconColor = theme.closeIconColor;
        secondaryButtonTheme = theme.secondaryButtonTheme;
        primaryButtonTheme = theme.primaryButtonTheme;
        break;
      case ElevarmAlertVariant.danger:
        assetNameIcon = Typicons.warning; //ElevarmIconsOutline.alert_triangle;
        iconColor = ElevarmColors.danger600;
        backgroundColor = ElevarmColors.danger100;
        borderColor = ElevarmColors.danger200;
        titleTextColor = ElevarmColors.danger600;
        subtitleTextColor = ElevarmColors.danger600;
        closeIconColor = ElevarmColors.danger400;
        secondaryButtonTheme = const ElevarmLinkButtonThemeData(
          onPrimaryColor: ElevarmColors.danger500,
        );
        primaryButtonTheme = const ElevarmLinkButtonThemeData(
          onPrimaryColor: ElevarmColors.danger600,
        );
        break;
      case ElevarmAlertVariant.warning:
        assetNameIcon = Typicons.warning; // ElevarmIconsOutline.alert_triangle;
        iconColor = ElevarmColors.warning700;
        backgroundColor = ElevarmColors.warning100;
        borderColor = ElevarmColors.warning200;
        titleTextColor = ElevarmColors.warning700;
        subtitleTextColor = ElevarmColors.warning700;
        closeIconColor = ElevarmColors.warning400;
        secondaryButtonTheme = const ElevarmLinkButtonThemeData(
          onPrimaryColor: ElevarmColors.warning600,
        );
        primaryButtonTheme = const ElevarmLinkButtonThemeData(
          onPrimaryColor: ElevarmColors.warning700,
        );
        break;
      case ElevarmAlertVariant.success:
        assetNameIcon = ElevarmIconsOutline.check_circle;
        iconColor = ElevarmColors.success700;
        backgroundColor = ElevarmColors.success100;
        borderColor = ElevarmColors.success200;
        titleTextColor = ElevarmColors.success700;
        subtitleTextColor = ElevarmColors.success700;
        closeIconColor = ElevarmColors.success400;
        secondaryButtonTheme = const ElevarmLinkButtonThemeData(
          onPrimaryColor: ElevarmColors.success600,
        );
        primaryButtonTheme = const ElevarmLinkButtonThemeData(
          onPrimaryColor: ElevarmColors.success700,
        );
        break;
      case ElevarmAlertVariant.info:
        assetNameIcon = Icons.info_outline; // ElevarmIconsOutline.info_circle;
        iconColor = ElevarmColors.info700;
        backgroundColor = ElevarmColors.info100;
        borderColor = ElevarmColors.info200;
        titleTextColor = ElevarmColors.info700;
        subtitleTextColor = ElevarmColors.info700;
        closeIconColor = ElevarmColors.info400;
        secondaryButtonTheme = const ElevarmLinkButtonThemeData(
          onPrimaryColor: ElevarmColors.info500,
        );
        primaryButtonTheme = const ElevarmLinkButtonThemeData(
          onPrimaryColor: ElevarmColors.info700,
        );
        break;
    }

    late EdgeInsets padding;
    switch (size) {
      case ElevarmAlertSize.mobile:
        padding = const EdgeInsets.all(12.0);
        break;
      case ElevarmAlertSize.desktop:
        padding = const EdgeInsets.all(16.0);
        break;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ElevarmBorderRadius.md,
        ),
        border: Border.all(
          color: borderColor,
        ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevarmIcon(
              assetNameIcon,
              color: iconColor,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (text?.isNotEmpty == true) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            text!,
                            style: ElevarmFontFamilies.inter(
                              fontSize: ElevarmFontSizes.sm,
                              fontWeight: ElevarmFontWeights.semibold,
                              color: titleTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (text?.isNotEmpty == true &&
                      subtitle?.isNotEmpty == true) ...[
                    const SizedBox(height: 4.0),
                  ],
                  if (subtitle?.isNotEmpty == true) ...[
                    Text(
                      subtitle!,
                      style: ElevarmFontFamilies.inter(
                        fontSize: ElevarmFontSizes.sm,
                        fontWeight: ElevarmFontWeights.regular,
                        color: subtitleTextColor,
                      ),
                    ),
                  ],
                  _buildActions(secondaryButtonTheme, primaryButtonTheme),
                ],
              ),
            ),
            if (onClose != null) ...[
              const SizedBox(width: 12.0),
              InkWell(
                onTap: onClose,
                child: ElevarmIcon(
                  // ElevarmIconsOutline.x_close,
                  Icons.close,
                  color: closeIconColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActions(
    ElevarmLinkButtonThemeData secondaryButtonTheme,
    ElevarmLinkButtonThemeData primaryButtonTheme,
  ) {
    bool showSecondaryAction = secondaryActionText?.isNotEmpty == true &&
        onPressedSecondaryAction != null;
    bool showPrimaryAction =
        primaryActionText?.isNotEmpty == true && onPressedPrimaryAction != null;
    // No actions.
    if (!showSecondaryAction && !showPrimaryAction) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12.0),
        Row(
          children: [
            // Builds secondary action if exists.
            if (showSecondaryAction)
              ElevarmLinkPrimaryButton.text(
                text: secondaryActionText!,
                onPressed: onPressedSecondaryAction,
                buttonThemeData: secondaryButtonTheme,
              ),
            // Builds margin if both actions exist.
            if (showSecondaryAction && showPrimaryAction)
              const SizedBox(width: 12.0),
            // Builds primary action if exists.
            if (showPrimaryAction)
              ElevarmLinkPrimaryButton.text(
                text: primaryActionText!,
                onPressed: onPressedPrimaryAction,
                buttonThemeData: primaryButtonTheme,
              ),
          ],
        ),
      ],
    );
  }
}
