import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

class ElevarmBottomNavigationBarItem implements BottomNavigationBarItem {
  final Widget? badge;
  final IconData iconAssetName;
  final Color iconColor;
  final String labelText;
  final Key? itemKey;

  ElevarmBottomNavigationBarItem({
    required this.labelText,
    required this.iconAssetName,
    this.badge,
    this.iconColor = ElevarmColors.primary500,
    this.itemKey,
  });

  @override
  Widget get activeIcon {
    if (badge == null) {
      return ElevarmIcon(
        iconAssetName,
        color: iconColor,
      );
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevarmIcon(
          iconAssetName,
          color: iconColor,
        ),
        Positioned(
          right: -6,
          top: -6,
          child: badge!,
        ),
      ],
    );
  }

  @override
  Color? get backgroundColor => null;

  @override
  Widget get icon {
    if (badge == null) {
      return ElevarmIcon(
        iconAssetName,
        color: ElevarmColors.neutral300,
      );
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ElevarmIcon(
          iconAssetName,
          color: ElevarmColors.neutral300,
        ),
        Positioned(
          right: -6,
          top: -6,
          child: badge!,
        ),
      ],
    );
  }

  @override
  String? get tooltip => null;

  @override
  String? get label => labelText;

  @override
  Key? get key => itemKey;
}
