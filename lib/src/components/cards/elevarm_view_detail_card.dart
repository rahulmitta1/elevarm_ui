import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

enum ElevarmViewDetailCardVariant {
  white,
  primary,
  secondary,
}

class ElevarmViewDetailCard extends StatelessWidget {
  final IconData leadingIconAssetName;
  final String title;
  final ElevarmViewDetailCardVariant variant;
  final IconData trailingIconAssetName;
  final Function(BuildContext context) onTap;
  final double leadingIconSize;
  final double trailingIconSize;

  const ElevarmViewDetailCard({
    required this.leadingIconAssetName,
    required this.title,
    required this.onTap,
    this.variant = ElevarmViewDetailCardVariant.white,
    this.trailingIconAssetName = ElevarmIconsOutline.arrow_right,
    this.leadingIconSize = 16.0,
    this.trailingIconSize = 16.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late Color borderColor;
    late Color leadingIconColor;
    late Color textColor;
    late Color trailingIconColor;
    switch (variant) {
      case ElevarmViewDetailCardVariant.white:
        backgroundColor = ElevarmColors.white;
        borderColor = ElevarmColors.neutral100;
        leadingIconColor = ElevarmColors.neutral300;
        textColor = ElevarmColors.neutral400;
        trailingIconColor = ElevarmColors.primary;
        break;
      case ElevarmViewDetailCardVariant.primary:
        backgroundColor = ElevarmColors.primary600;
        borderColor = ElevarmColors.primary600;
        leadingIconColor = ElevarmColors.primary200;
        textColor = ElevarmColors.primary100;
        trailingIconColor = ElevarmColors.primary100;
        break;
      case ElevarmViewDetailCardVariant.secondary:
        backgroundColor = ElevarmColors.primary100;
        borderColor = ElevarmColors.primary200;
        leadingIconColor = ElevarmColors.primary;
        textColor = ElevarmColors.neutral400;
        trailingIconColor = ElevarmColors.primary;
        break;
    }

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
      child: InkWell(
        borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
        onTap: () {
          onTap(context);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevarmIcon(
                leadingIconAssetName,
                color: leadingIconColor,
                size: leadingIconSize,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  title,
                  style: ElevarmFontFamilies.inter(
                    fontSize: ElevarmFontSizes.sm,
                    fontWeight: ElevarmFontWeights.medium,
                    color: textColor,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              ElevarmIcon(
                trailingIconAssetName,
                color: trailingIconColor,
                size: trailingIconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
