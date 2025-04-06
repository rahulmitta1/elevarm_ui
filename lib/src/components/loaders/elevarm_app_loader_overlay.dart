import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmAppLoaderOverlay extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color progressIndicatorColor;

  const ElevarmAppLoaderOverlay({
    this.title = 'Memuat...',
    this.titleColor = ElevarmColors.primary600,
    this.progressIndicatorColor = ElevarmColors.primary600,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: progressIndicatorColor),
            const SizedBox(height: 20),
            Text(
              title,
              style: ElevarmFontFamilies.inter(
                fontSize: ElevarmFontSizes.md,
                fontWeight: ElevarmFontWeights.medium,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
