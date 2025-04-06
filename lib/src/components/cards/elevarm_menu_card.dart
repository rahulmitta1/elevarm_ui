import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

enum ElevarmMenuCardVariant {
  elevated,
  text,
}

/// Tappable menu card widget.
class ElevarmMenuCard extends StatelessWidget {
  /// The card's title.
  final String title;

  /// The card's subtitle.
  final String? subtitle;

  /// The card's icon.
  final IconData icon;

  /// The card's icon variant.
  final ElevarmFilledIconVariant iconVariant;

  /// The callback when the card is tapped.
  final VoidCallback? onTap;

  /// The title's max lines.
  final int? maxLinesTitle;

  /// The subtitle's max lines.
  final int? maxLinesSubtitle;

  /// Opacity when card is disabled.
  final double disabledOpacity;

  /// The card's variant.
  final ElevarmMenuCardVariant variant;

  const ElevarmMenuCard({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.iconVariant,
    this.subtitle,
    this.maxLinesTitle = 1,
    this.maxLinesSubtitle = 1,
    this.disabledOpacity = 0.3,
    this.variant = ElevarmMenuCardVariant.elevated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return _buildCard(context, variant);
    } else {
      return Opacity(
        opacity: disabledOpacity,
        child: _buildCard(context, variant),
      );
    }
  }

  Widget _buildCard(BuildContext context, ElevarmMenuCardVariant variant) {
    switch (variant) {
      case ElevarmMenuCardVariant.elevated:
        return _buildElevatedCard(context);
      case ElevarmMenuCardVariant.text:
        return _buildTextCard(context);
    }
  }

  Widget _buildElevatedCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: ElevarmBoxShadow.sm,
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
      ),
      child: Material(
        color: ElevarmColors.white,
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ElevarmColors.neutral50,
              ),
              borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 12.0,
              ),
              child: Column(
                children: [
                  ElevarmFilledIcon(
                    icon: icon,
                    variant: iconVariant,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: maxLinesTitle,
                    overflow: TextOverflow.ellipsis,
                    style: LibraryTextStyles.interSmSemiboldNeutral,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle!,
                      textAlign: TextAlign.center,
                      maxLines: maxLinesSubtitle,
                      overflow: TextOverflow.ellipsis,
                      style: LibraryTextStyles.interXsRegularNeutral300,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextCard(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(ElevarmBorderRadius.xs),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.xs),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              ElevarmFilledIcon(
                icon: icon,
                iconSize: 24.0,
                variant: iconVariant,
              ),
              const SizedBox(height: 12.0),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: maxLinesTitle,
                overflow: TextOverflow.ellipsis,
                style: LibraryTextStyles.interXsRegularNeutral,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
