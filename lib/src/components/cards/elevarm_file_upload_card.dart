import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

class ElevarmFileUploadCard extends StatelessWidget {
  /// Title of cards.
  /// Usually used to display filename.
  final String title;

  /// Subtitle of cards.
  /// Usually used to display timestamp and filesize
  final String subtitle;

  /// Whether to show progress indicator.
  final bool isLoading;

  /// File upload progresss from 0 to 1, or null to hide progress indicator.
  final double? loadingProgress;

  /// Icon asset name on left
  final IconData iconAssetName;

  /// Action icon asset name on right
  final IconData? actionIconAssetName;

  /// Callback when action icon is pressed.
  final VoidCallback? onTapAction;

  /// Callback when card is pressed.
  final VoidCallback? onTap;

  /// Icon color
  final Color iconColor;

  /// Icon background color
  final Color iconBackgroundColor;

  const ElevarmFileUploadCard({
    required this.title,
    required this.subtitle,
    this.isLoading = false,
    this.loadingProgress,
    this.iconAssetName = ElevarmIconsOutline.image_01,
    this.actionIconAssetName,
    this.onTapAction,
    this.onTap,
    this.iconColor = ElevarmColors.primary,
    this.iconBackgroundColor = ElevarmColors.primary100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: ElevarmBorderRadius.md,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ElevarmColors.white,
          border: Border.all(
            color: ElevarmColors.neutral100,
          ),
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.md),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36.0,
              height: 36.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconBackgroundColor,
              ),
              child: Center(
                child: ElevarmIcon(
                  iconAssetName,
                  color: iconColor,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: LibraryTextStyles.interSmSemiboldNeutral,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      if (actionIconAssetName != null)
                        ElevarmLinkNeutralButton.iconOnly(
                          iconAssetName: actionIconAssetName!,
                          onPressed: onTapAction,
                        ),
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    subtitle,
                    style: LibraryTextStyles.interXsRegularNeutral300,
                  ),
                  const SizedBox(height: 2.0),
                  isLoading
                      ? Row(
                          children: [
                            Expanded(
                              child: ElevarmLinearProgressIndicator(
                                value: loadingProgress,
                              ),
                            ),
                            if (loadingProgress != null) ...[
                              const SizedBox(width: 12.0),
                              Text(
                                '${(loadingProgress! * 100).toStringAsFixed(1)}'
                                '%',
                                style: LibraryTextStyles.interSmMediumGrey700,
                              ),
                            ],
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
