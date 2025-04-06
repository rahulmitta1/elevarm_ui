// ignore_for_file: deprecated_member_use_from_same_package

import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// Card for selecting file to be uploaded.
class ElevarmInputFileCard extends StatelessWidget {
  /// Callback when card is tapped. Set this to null to disable the card.
  final VoidCallback? onTap;

  /// Card's 'Click to upload' label.
  final String clickToUploadLabel;

  /// Card's ' or drag and drop' label.
  final String orDragAndDropLabel;

  /// Card's subtitle.
  final String subtitle;

  /// Text color
  final Color textColor;

  const ElevarmInputFileCard({
    super.key,
    this.onTap,
    this.clickToUploadLabel = 'Click to upload',
    this.orDragAndDropLabel = ' or drag and drop',
    this.subtitle = 'SVG, PNG, JPG or GIF (max. 800x400px)',
    this.textColor = ElevarmColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ElevarmColors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ElevarmColors.neutral50),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                ElevarmBorderRadius.md,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Column(
            children: [
              const ElevarmIconRipple(
                backgroundColor: ElevarmColors.neutral50,
                iconAssetName: ElevarmIconsOutline.upload_cloud_02,
                iconColor: ElevarmColors.neutral300,
                rippleColor: ElevarmColors.neutral25,
              ),
              const SizedBox(height: 12.0),
              RichText(
                text: TextSpan(
                  text: clickToUploadLabel,
                  style: ElevarmFontFamilies.inter(
                    fontSize: ElevarmFontSizes.sm,
                    fontWeight: ElevarmFontWeights.semibold,
                    color: onTap != null ? textColor : ElevarmColors.neutral100,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: orDragAndDropLabel,
                      style: LibraryTextStyles.interSmRegularNeutral400,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                subtitle,
                style: LibraryTextStyles.interSmRegularNeutral400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
