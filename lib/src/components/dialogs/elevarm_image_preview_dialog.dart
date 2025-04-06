import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmImagePreviewDialog {
  /// Dialog's title.
  final String title;

  /// Dialog content widget.
  final Widget? child;

  /// Image URl.
  final String imageUrl;

  /// Callback on close button.
  final VoidCallback onPressedClose;

  /// Callback on fullscreen button.
  final VoidCallback onPressedFullscreen;

  const ElevarmImagePreviewDialog({
    required this.title,
    required this.imageUrl,
    required this.onPressedClose,
    required this.onPressedFullscreen,
    this.child,
  });

  Future<void> show(BuildContext context) {
    return ElevarmUiUtils.showElevarmDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: ElevarmFontFamilies.poppins(
                          fontWeight: ElevarmFontWeights.semibold,
                          fontSize: ElevarmFontSizes.lg,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    ElevarmLinkNeutralButton.iconOnly(
                      iconAssetName: ElevarmIconsOutline.x_close,
                      onPressed: onPressedClose,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                if (child != null) ...[
                  child!,
                ],
                Image.network(
                  imageUrl,
                  height: 200.0,
                ),
                const SizedBox(height: 16.0),
                ElevarmLinkNeutralButton.icon(
                  text: 'Fullscreen',
                  leadingIconAssetName: ElevarmIconsOutline.maximize_01,
                  trailingIconAssetName: null,
                  onPressed: onPressedFullscreen,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
