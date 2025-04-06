import 'package:elevarm_ui/src/components/bottom_navigation_bars/elevarm_bottom_navigation_bar_item.dart';
import 'package:elevarm_ui/src/styles/library_text_styles.dart';
import 'package:flutter/material.dart';

class ElevarmBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  final List<ElevarmBottomNavigationBarItem> items;

  const ElevarmBottomNavigationBar({
    required this.currentIndex,
    required this.items,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedLabelStyle: LibraryTextStyles.interXsMediumPrimary,
      unselectedLabelStyle: LibraryTextStyles.interXsRegularNeutral300,
      items: items,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    );
  }
}
