import 'package:elevarm_icons/elevarm_icons.dart';
import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:elevarm_ui/src/styles/styles.dart';
import 'package:flutter/material.dart';

class ElevarmBottomSheet extends StatelessWidget {
  /// Bottom sheet title.
  final String? title;

  /// Callback when close button is pressed.
  final VoidCallback? onPressedClose;

  /// Bottom sheet content children.
  final List<Widget> children;

  /// Children's cross axis alignment.
  final CrossAxisAlignment childrenCrossAxisAlignment;

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

  const ElevarmBottomSheet({
    required this.children,
    this.title,
    this.onPressedClose,
    this.childrenCrossAxisAlignment = CrossAxisAlignment.start,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 1.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      expand: false,
      builder: (context, controller) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(ElevarmBorderRadius.md),
            ),
            color: Colors.white,
          ),
          child: ListView(
            controller: controller,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  top: 6.0,
                ),
                child: Column(
                  crossAxisAlignment: childrenCrossAxisAlignment,
                  children: [
                    Center(
                      child: Container(
                        height: 4.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use_from_same_package
                          color: ElevarmColors.grey500, // FIXME
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    if (title != null || onPressedClose != null)
                      Column(
                        crossAxisAlignment: childrenCrossAxisAlignment,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: title != null
                                    ? Text(
                                        title!,
                                        style: LibraryTextStyles
                                            .poppinsLgSemiboldNeutral,
                                      )
                                    : Container(),
                              ),
                              onPressedClose != null
                                  ? IconButton(
                                      onPressed: onPressedClose,
                                      icon: const ElevarmIcon(
                                        ElevarmIconsOutline.x_close,
                                        color: ElevarmColors.neutral500,
                                        size: 24.0,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    ...children,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
