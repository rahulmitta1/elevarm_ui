import 'package:collection/collection.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Outline Tab Bar component widget.
class ElevarmTabBar extends StatelessWidget {
  /// Currently active index.
  final int activeIndex;

  /// Tabs' label.
  final List<String> labels;

  /// Callback when a tab is clicked.
  final void Function(int index) onChange;

  /// Whether the tab is expanded or not.
  final bool isTabExpanded;

  /// Whether the tab is scrollable or not.
  final bool isTabScrollable;

  final BoxDecoration decoration;

  const ElevarmTabBar({
    required this.labels,
    required this.activeIndex,
    required this.onChange,
    super.key,
    this.isTabExpanded = true,
    this.isTabScrollable = false,
    this.decoration = const BoxDecoration(
      color: ElevarmColors.neutral50,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  }) : assert(
          !(isTabExpanded && isTabScrollable),
          'Both isTabExpanded and isTabScrollable cannot be true',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
        ),
        child: isTabScrollable
            ? SingleChildScrollView(
                primary: false,
                scrollDirection: Axis.horizontal,
                child: _buildTabsContent(),
              )
            : _buildTabsContent(),
      ),
    );
  }

  /// Build tabs content widget.
  Widget _buildTabsContent() {
    return Row(
      children: labels.mapIndexed<Widget>(
        (index, label) {
          if (index == activeIndex) {
            return _buildActiveTab(
              label: label,
              onPressed: () {
                onChange(index);
              },
            );
          }
          return _buildInactiveTab(
            label: label,
            onPressed: () {
              onChange(index);
            },
          );
        },
      ).toList(),
    );
  }

  /// Build active tab widget.
  Widget _buildActiveTab({
    required String label,
    required VoidCallback onPressed,
  }) {
    if (isTabExpanded) {
      return Expanded(
        child: _buildActiveTabContent(
          label: label,
          onPressed: onPressed,
        ),
      );
    } else {
      return _buildActiveTabContent(
        label: label,
        onPressed: onPressed,
      );
    }
  }

  /// Build active tab content widget.
  Widget _buildActiveTabContent({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: ElevarmBoxShadow.sm,
        ),
        child: Material(
          color: ElevarmColors.white,
          borderRadius: BorderRadius.circular(6.0),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: Text(
                label,
                style: LibraryTextStyles.interSmSemiboldNeutral,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Build inactive tab widget.
  Widget _buildInactiveTab({
    required String label,
    required VoidCallback onPressed,
  }) {
    if (isTabExpanded) {
      return Expanded(
        child: _buildInactiveTabContent(
          label: label,
          onPressed: onPressed,
        ),
      );
    } else {
      return _buildInactiveTabContent(
        label: label,
        onPressed: onPressed,
      );
    }
  }

  /// Build inactive tab widget.
  Widget _buildInactiveTabContent({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          child: Text(
            label,
            style: LibraryTextStyles.interSmMediumNeutral300,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
