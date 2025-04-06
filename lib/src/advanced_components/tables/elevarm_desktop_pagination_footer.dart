import 'dart:math';

import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's pagination footer component widget for Desktop.
class ElevarmDesktopPaginationFooter extends StatelessWidget {
  /// Widget's height
  final double height;

  /// Current page (starting from 1).
  final int currentPage;

  /// Total number of pages.
  final int numPages;

  /// Callback when previous button is pressed.
  /// Set this to null to disable the button.
  final VoidCallback? onPressedPrevious;

  /// Callback when next button is pressed.
  /// Set this to null to disable the button.
  final VoidCallback? onPressedNext;

  /// Callback when page button is pressed.
  /// Set this to null to disable the button.
  final Function(int page)? onPressedPage;

  /// Previous button icon asset name.
  final IconData previousIconAssetName;

  /// Next button icon asset name.
  final IconData nextIconAssetName;

  const ElevarmDesktopPaginationFooter({
    required this.currentPage,
    required this.numPages,
    required this.onPressedPrevious,
    required this.onPressedNext,
    required this.onPressedPage,
    this.previousIconAssetName = ElevarmIconsOutline.chevron_left_double,
    this.nextIconAssetName = ElevarmIconsOutline.chevron_right_double,
    this.height = 40,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          ElevarmOutlineButton.iconOnly(
            iconAssetName: previousIconAssetName,
            onPressed: onPressedPrevious,
            height: ElevarmButtonHeights.sm,
          ),
          const Spacer(),
          SizedBox(
            width: 300,
            child: LayoutBuilder(
              builder: (context, constraints) {
                var buttonWidth = constraints.maxHeight;
                var availableSpots =
                    (constraints.maxWidth / buttonWidth).floor();
                List<Widget> buttons = [
                  _buildButton(0),
                  if (_frontDotsShouldShow(availableSpots)) _buildDots(),
                  if (numPages > 1) ..._generateButtonList(availableSpots),
                  if (_backDotsShouldShow(availableSpots)) _buildDots(),
                  if (numPages > 1) _buildButton(numPages - 1),
                ];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...buttons.map(
                      (button) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: button,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Spacer(),
          ElevarmOutlineButton.iconOnly(
            iconAssetName: nextIconAssetName,
            onPressed: onPressedNext,
            height: ElevarmButtonHeights.sm,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(int index) {
    final page = index + 1;
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: page == currentPage ? ElevarmColors.primary100 : null,
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(ElevarmBorderRadius.sm),
          onTap: onPressedPage != null ? () => onPressedPage!(page) : null,
          child: Center(
            child: Text(
              page.toString(),
              style: page == currentPage
                  ? LibraryTextStyles.interSmMediumPrimary500
                  : LibraryTextStyles.interSmMediumNeutral400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDots() => const AspectRatio(
        aspectRatio: 1,
        child: ElevarmIcon(ElevarmIconsOutline.dots_horizontal),
      );

  /// Generates the variable button list which is at
  /// the center of the (optional) dots.
  /// The very last and first pages are shown independently of this list.
  List<Widget> _generateButtonList(int availableSpots) {
    // if dots shown: available minus (2 for first and last pages + 2 for dots)
    var shownPages = availableSpots -
        2 -
        (_backDotsShouldShow(availableSpots) ? 1 : 0) -
        (_frontDotsShouldShow(availableSpots) ? 1 : 0);

    var numberPages = numPages;

    int minValue, maxValue;
    minValue = max(1, currentPage - shownPages ~/ 2);
    maxValue = min(minValue + shownPages, numberPages - 1);
    if (maxValue - minValue < shownPages) {
      minValue = (maxValue - shownPages).clamp(1, numberPages - 1);
    }

    return List.generate(
      maxValue - minValue,
      (index) => _buildButton(minValue + index),
    );
  }

  /// Checks if pages don't fit in available spots and dots have to be shown.
  bool _backDotsShouldShow(int availableSpots) =>
      availableSpots < numPages && currentPage < numPages - availableSpots ~/ 2;

  bool _frontDotsShouldShow(int availableSpots) =>
      availableSpots < numPages && currentPage > availableSpots ~/ 2 - 1;
}
