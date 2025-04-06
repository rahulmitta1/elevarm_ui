import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

/// Base bottom sheet widget with the predefined shape and grey line at the top.
class ElevarmDraggableBottomSheet extends StatelessWidget {
  /// Bottom sheet title.
  final String title;

  /// Bottom sheet subtitle.
  final String? subtitle;

  /// Callback when close button is pressed.
  final VoidCallback onPressedClose;

  /// Bottom sheet content children.
  final List<Widget> children;

  /// The initial fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// Rebuilding the sheet with a new [initialChildSize] will only move the
  /// the sheet to the new value if the sheet has not yet been dragged since it
  /// was first built or since the last call to
  /// [DraggableScrollableActuator.reset].
  ///
  /// The default value is `0.5`.
  final double initialChildSize;

  /// The minimum fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// The default value is `0.25`.
  final double minChildSize;

  /// The maximum fractional value of the parent container's height to use when
  /// displaying the widget.
  ///
  /// The default value is `1.0`.
  final double maxChildSize;

  /// Height of pinned footer container
  final double footerHeight;

  /// Footer's widget
  final Widget? footerWidget;

  /// Height offset for `maxChildSize` to
  /// solve sliding up when keyboard is showing.
  final double maxChildSizeOffset;

  /// Height offset for snapping bottom sheet to offset position
  /// instead of exact `minChildSize` position.
  ///
  /// So bottom sheet won't be closed
  final double minChildSizeOffset;

  /// Custom [SliverPersistentHeaderDelegate]
  final SliverPersistentHeaderDelegate? sliverPersistentHeaderDelegate;

  const ElevarmDraggableBottomSheet({
    required this.title,
    required this.onPressedClose,
    required this.children,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 1.0,
    this.footerHeight = ElevarmButtonHeights.lg,
    this.footerWidget,
    this.maxChildSizeOffset = 0.1,
    this.minChildSizeOffset = 0.05,
    this.subtitle,
    super.key,
    this.sliverPersistentHeaderDelegate,
  });

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bool keyboardShowing = keyboardHeight > 0;

    final double maxChildSizeFinal = maxChildSize + maxChildSizeOffset > 1
        ? 1
        : maxChildSize + maxChildSizeOffset;

    return Padding(
      padding: EdgeInsets.only(bottom: keyboardShowing ? keyboardHeight : 0),
      child: DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: !keyboardShowing ? maxChildSize : maxChildSizeFinal,
        expand: false,
        snapSizes: [
          minChildSize + minChildSizeOffset,
          initialChildSize,
          if (initialChildSize < maxChildSize)
            !keyboardShowing ? maxChildSize : maxChildSizeFinal,
        ],
        snap: true,
        builder: (context, controller) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Container(
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.only(
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
                top: 6.0,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(ElevarmBorderRadius.md),
                ),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  CustomScrollView(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverPersistentHeader(
                        delegate: sliverPersistentHeaderDelegate ??
                            _SectionHeaderDelegate(
                              title: title,
                              subtitle: subtitle,
                              onPressedClose: onPressedClose,
                            ),
                        pinned: true,
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          children,
                        ),
                      ),
                      if (footerWidget != null)
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Container(
                            height: footerHeight + 16,
                          ),
                        ),
                    ],
                  ),
                  if (footerWidget != null)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: footerWidget!,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// [ElevarmDraggableBottomSheet] header widget.
///
/// Consists of title, bottom sheet drag handle and close button
class _SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  final String? subtitle;

  /// Callback when close button is pressed.
  final VoidCallback onPressedClose;

  // ignore: unused_element
  _SectionHeaderDelegate({
    required this.title,
    required this.onPressedClose,
    this.subtitle,
  });

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ElevarmColors.white,
      height: subtitle != null ? 112 : 64,
      child: Column(
        children: [
          Center(
            child: Container(
              height: 4.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: ElevarmColors.neutral,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: subtitle != null ? _buildTitleAndSubtitle() : _buildTitle(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() => Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: LibraryTextStyles.poppinsLgSemiboldNeutral,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          IconButton(
            onPressed: onPressedClose,
            icon: const ElevarmIcon(
              ElevarmIconsOutline.x_close,
              color: ElevarmColors.neutral,
              size: 24.0,
            ),
          ),
        ],
      );

  Widget _buildTitleAndSubtitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          Text(
            subtitle!,
            style: LibraryTextStyles.interSmRegularNeutral300,
          ),
          const Spacer(),
          const ElevarmDivider(
            height: 1,
          ),
        ],
      );

  @override
  double get maxExtent => subtitle != null ? 112 : 64;

  @override
  double get minExtent => subtitle != null ? 112 : 64;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
