import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

// FIXME: Move this somewhere else
const mobileMaxWidth = 600;
// FIXME: Move this somewhere else
const mobileDialogMaxWidth = 480.0;

enum ElevarmConfirmAlertDialogSize {
  adaptive,
  desktop,
  mobile,
}

class ElevarmConfirmAlertDialog {
  /// Dialog's title
  final String title;

  /// Dialog's subtitle
  final String subtitle;

  /// Positive button text
  final String? positiveText;

  /// Negative button text
  final String? negativeText;

  /// Callback on positive button
  final VoidCallback? onPositiveButton;

  /// Callback on negative button
  final VoidCallback? onNegativeButton;

  /// Dialog's variant.
  final ElevarmDialogVariant variant;

  /// Dialog's size.
  final ElevarmConfirmAlertDialogSize size;

  /// Dialog's max width.
  final double maxWidth;

  // Dialog's icon asset name.
  final IconData? iconAssetName;

  const ElevarmConfirmAlertDialog({
    required this.title,
    required this.subtitle,
    this.onPositiveButton,
    this.onNegativeButton,
    this.positiveText,
    this.negativeText,
    this.variant = ElevarmDialogVariant.basic,
    this.size = ElevarmConfirmAlertDialogSize.adaptive,
    this.maxWidth = mobileDialogMaxWidth,
    this.iconAssetName,
  });

  Future<T?> show<T>(BuildContext context) {
    IconData finalIcon;
    late ElevarmIconRippleVariant iconRippleVariant;
    bool isPositiveButtonDestructive = false;
    switch (variant) {
      case ElevarmDialogVariant.primary:
        finalIcon = iconAssetName ?? ElevarmIconsOutline.check_circle;
        iconRippleVariant = ElevarmIconRippleVariant.primary;
        break;
      case ElevarmDialogVariant.success:
        finalIcon = iconAssetName ?? ElevarmIconsOutline.check_circle;
        iconRippleVariant = ElevarmIconRippleVariant.success;
        break;
      case ElevarmDialogVariant.warning:
        finalIcon = iconAssetName ?? ElevarmIconsOutline.alert_triangle;
        iconRippleVariant = ElevarmIconRippleVariant.warning;
        break;
      case ElevarmDialogVariant.danger:
        finalIcon = iconAssetName ?? ElevarmIconsOutline.alert_triangle;
        isPositiveButtonDestructive = true;
        iconRippleVariant = ElevarmIconRippleVariant.danger;
        break;
      case ElevarmDialogVariant.basic:
      default:
        finalIcon = iconAssetName ?? ElevarmIconsOutline.info_circle;
        iconRippleVariant = ElevarmIconRippleVariant.defaultV;
        break;
    }

    return ElevarmUiUtils.showElevarmDialog<T>(
      context: context,
      builder: (context) {
        return _buildDialog(
          context: context,
          finalIcon: finalIcon,
          iconRippleVariant: iconRippleVariant,
          isPositiveButtonDestructive: isPositiveButtonDestructive,
        );
      },
    );
  }

  Widget _buildDialog({
    required BuildContext context,
    required IconData finalIcon,
    required ElevarmIconRippleVariant iconRippleVariant,
    required bool isPositiveButtonDestructive,
  }) {
    bool useMobile = true;
    switch (size) {
      case ElevarmConfirmAlertDialogSize.mobile:
        useMobile = true;
        break;
      case ElevarmConfirmAlertDialogSize.desktop:
        useMobile = false;
        break;
      case ElevarmConfirmAlertDialogSize.adaptive:
        useMobile = MediaQuery.of(context).size.width < mobileMaxWidth;
        break;
    }
    bool isBuildNegativeButton = negativeText?.isNotEmpty == true;
    bool isBuildPositiveButton = positiveText?.isNotEmpty == true;
    if (useMobile) {
      return _buildMobileDialog(
        context: context,
        finalIcon: finalIcon,
        iconRippleVariant: iconRippleVariant,
        isPositiveButtonDestructive: isPositiveButtonDestructive,
        isBuildNegativeButton: isBuildNegativeButton,
        isBuildPositiveButton: isBuildPositiveButton,
      );
    } else {
      return _buildDesktopDialog(
        context: context,
        finalIcon: finalIcon,
        iconRippleVariant: iconRippleVariant,
        isPositiveButtonDestructive: isPositiveButtonDestructive,
        isBuildNegativeButton: isBuildNegativeButton,
        isBuildPositiveButton: isBuildPositiveButton,
      );
    }
  }

  Widget _buildMobileDialog({
    required BuildContext context,
    required IconData finalIcon,
    required ElevarmIconRippleVariant iconRippleVariant,
    required bool isPositiveButtonDestructive,
    required bool isBuildNegativeButton,
    required bool isBuildPositiveButton,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                right: 16.0,
                left: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevarmIconRipple(
                    iconAssetName: finalIcon,
                    variant: iconRippleVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: LibraryTextStyles.poppinsLgSemiboldNeutral,
                  ),
                  Text(
                    subtitle,
                    style: LibraryTextStyles.interSmRegularNeutral300,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const ElevarmDivider(height: 0.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isBuildPositiveButton)
                    SizedBox(
                      width: double.infinity,
                      child: ElevarmPrimaryButton.text(
                        height: ElevarmAvatarSizes.lg,
                        text: positiveText!,
                        onPressed: onPositiveButton,
                        isDestructive: isPositiveButtonDestructive,
                      ),
                    ),
                  if (isBuildPositiveButton && isBuildNegativeButton)
                    const SizedBox(height: 8),
                  if (isBuildNegativeButton)
                    SizedBox(
                      width: double.infinity,
                      child: ElevarmOutlineButton.text(
                        height: ElevarmAvatarSizes.lg,
                        text: negativeText!,
                        onPressed: onNegativeButton,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopDialog({
    required BuildContext context,
    required IconData finalIcon,
    required ElevarmIconRippleVariant iconRippleVariant,
    required bool isPositiveButtonDestructive,
    required bool isBuildNegativeButton,
    required bool isBuildPositiveButton,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
      ),
      backgroundColor: ElevarmColors.white,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth, minWidth: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevarmIconRipple(
                        iconAssetName: finalIcon,
                        variant: iconRippleVariant,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const ElevarmIcon(
                          ElevarmIconsOutline.x_close,
                          color: ElevarmColors.neutral300,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    title,
                    style: LibraryTextStyles.poppinsXlSemiboldNeutral,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: LibraryTextStyles.interMdRegularNeutral300,
                  ),
                ],
              ),
            ),
            const ElevarmDivider(height: 0.0),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  if (isBuildNegativeButton)
                    Expanded(
                      child: ElevarmOutlineButton.text(
                        height: ElevarmAvatarSizes.lg,
                        text: negativeText!,
                        onPressed: onNegativeButton,
                      ),
                    ),
                  if (isBuildNegativeButton && isBuildPositiveButton)
                    const SizedBox(width: 12.0),
                  if (isBuildPositiveButton)
                    Expanded(
                      child: ElevarmPrimaryButton.text(
                        height: ElevarmAvatarSizes.lg,
                        text: positiveText!,
                        onPressed: onPositiveButton,
                        isDestructive: isPositiveButtonDestructive,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
