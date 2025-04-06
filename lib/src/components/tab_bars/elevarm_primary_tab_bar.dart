import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// Elevarm UI's Primary Tab Bar component widget.
class ElevarmPrimaryTabBar extends StatelessWidget {
  /// Currently active index.
  final int activeIndex;

  /// Tabs' label.
  final List<String> labels;

  /// Callback when a tab is clicked.
  final void Function(int index) onChange;

  const ElevarmPrimaryTabBar({
    required this.labels,
    required this.activeIndex,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ElevarmColors.neutral100,
          ),
        ),
      ),
      height: 44.0,
      child: _buildTabsContent(),
    );
  }

  /// Build tabs content widget.
  Widget _buildTabsContent() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String label = labels[index];
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
      separatorBuilder: (context, index) {
        return const SizedBox(width: 16.0);
      },
      itemCount: labels.length,
    );
  }

  /// Build active tab widget.
  Widget _buildActiveTab({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: ElevarmColors.primary100,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(
            color: ElevarmColors.primary100,
            border: Border(
              bottom: BorderSide(
                color: ElevarmColors.primary500,
                width: 2,
              ),
            ),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            style: LibraryTextStyles.interSmSemiboldPrimary,
            textAlign: TextAlign.center,
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
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(12.0),
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
