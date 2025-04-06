import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's SnackBar Content component widget.
class ElevarmSnackBarContent extends StatelessWidget {
  /// Leading icon asset name.
  final IconData iconAssetName;

  /// Leading icon color.
  final Color iconColor;

  /// The SnackBar content title.
  final String title;

  /// The SnackBar content subtitle.
  final String? subtitle;

  /// The SnackBar positive button text.
  final String? positiveText;

  /// The SnackBar negative button text.
  final String? negativeText;

  /// Callback when pressing positive button.
  final VoidCallback? onPositiveButton;

  /// Callback when pressing negative button.
  final VoidCallback? onNegativeButton;

  /// Callback when pressing close button.
  final VoidCallback onCloseButton;

  const ElevarmSnackBarContent({
    required this.iconAssetName,
    required this.iconColor,
    required this.title,
    required this.onCloseButton,
    this.subtitle,
    this.positiveText,
    this.negativeText,
    this.onPositiveButton,
    this.onNegativeButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
          color: ElevarmColors.white,
          boxShadow: ElevarmBoxShadow.lg,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevarmIcon(
              iconAssetName,
              color: iconColor,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: LibraryTextStyles.interSmSemiboldNeutral,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle!,
                      style: LibraryTextStyles.interSmRegularNeutral400,
                    ),
                  ],
                  if (negativeText != null || positiveText != null) ...[
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        if (negativeText != null)
                          Flexible(
                            child: ElevarmLinkNeutralButton.text(
                              height: ElevarmButtonHeights.sm,
                              text: negativeText!,
                              onPressed: onNegativeButton,
                            ),
                          ),
                        if (positiveText != null) ...[
                          const SizedBox(width: 12.0),
                          Flexible(
                            child: ElevarmLinkPrimaryButton.text(
                              height: ElevarmButtonHeights.sm,
                              text: positiveText!,
                              onPressed: onPositiveButton,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            ElevarmLinkNeutralButton.iconOnly(
              iconAssetName: ElevarmIconsOutline.x_close,
              onPressed: onCloseButton,
            ),
          ],
        ),
      ),
    );
  }
}
