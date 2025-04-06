import 'dart:async';
import 'dart:math';

import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Global OverlayEntry for SnackBar.
Map<String, OverlayEntry> _snackBarOverlayEntry = {};

bool _isShowingSnackbar = false;

/// Shows [ElevarmSnackBar] on top of the current screen.
///
/// This method is similar to [showElevarmSnackBar] but it uses default values
/// specified for Desktop screen.
OverlayEntry showElevarmSnackBarDesktop({
  required BuildContext context,
  required IconData iconAssetName,
  required Color iconColor,
  required String title,
  void Function(AnimationController?)? onCloseButton,
  String? subtitle,
  String? positiveText,
  String? negativeText,
  void Function(AnimationController?)? onPositiveButton,
  void Function(AnimationController?)? onNegativeButton,
  double? maxWidth = 400.0,
  Duration duration = const Duration(seconds: 1),
  Duration reverseDuration = const Duration(seconds: 1),
  Duration dismissDuration = const Duration(seconds: 5),
  Alignment alignment = Alignment.topCenter,
  BoxDecoration backgroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(16, 24, 40, 0.35),
        Color.fromRGBO(255, 255, 255, 0),
      ],
      stops: [0.0, 0.6],
    ),
  ),
  double backgroundHeight = 150.0,
  void Function(AnimationController)? onAnimationControllerInit,
}) {
  if (_isShowingSnackbar) {
    return OverlayEntry(builder: (_) => const SizedBox());
  }
  _isShowingSnackbar = true;

  var random = Random.secure().nextInt(10000);
  var snackbarId = '${DateTime.now().microsecondsSinceEpoch}-$random';
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (_) {
      return ElevarmSnackBar(
        snackbarId: snackbarId,
        iconAssetName: iconAssetName,
        iconColor: iconColor,
        title: title,
        subtitle: subtitle,
        positiveText: positiveText,
        negativeText: negativeText,
        onPositiveButton: onPositiveButton,
        onNegativeButton: onNegativeButton,
        onCloseButton: onCloseButton,
        maxWidth: maxWidth,
        alignment: alignment,
        backgroundDecoration: backgroundDecoration,
        backgroundHeight: backgroundHeight,
        onAnimationControllerInit: onAnimationControllerInit,
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);

  _snackBarOverlayEntry[snackbarId] = overlayEntry;

  _isShowingSnackbar = false;
  return overlayEntry;
}

/// Shows [ElevarmSnackBar] on top of the current screen.
OverlayEntry showElevarmSnackBar({
  required BuildContext context,
  required IconData iconAssetName,
  required Color iconColor,
  required String title,
  void Function(AnimationController?)? onCloseButton,
  String? subtitle,
  String? positiveText,
  String? negativeText,
  void Function(AnimationController?)? onPositiveButton,
  void Function(AnimationController?)? onNegativeButton,
  double? maxWidth,
  Duration duration = const Duration(seconds: 1),
  Duration reverseDuration = const Duration(seconds: 1),
  Duration dismissDuration = const Duration(seconds: 5),
  Alignment alignment = Alignment.topCenter,
  BoxDecoration backgroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(16, 24, 40, 0.35),
        Color.fromRGBO(255, 255, 255, 0),
      ],
    ),
  ),
  double backgroundHeight = 150.0,
  void Function(AnimationController)? onAnimationControllerInit,
}) {
  if (_isShowingSnackbar) {
    return OverlayEntry(builder: (_) => const SizedBox());
  }
  _isShowingSnackbar = true;

  var random = Random.secure().nextInt(10000);
  var snackbarId = '${DateTime.now().microsecondsSinceEpoch}-$random';
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (_) {
      return ElevarmSnackBar(
        snackbarId: snackbarId,
        iconAssetName: iconAssetName,
        iconColor: iconColor,
        title: title,
        subtitle: subtitle,
        positiveText: positiveText,
        negativeText: negativeText,
        onPositiveButton: onPositiveButton,
        onNegativeButton: onNegativeButton,
        onCloseButton: onCloseButton,
        maxWidth: maxWidth,
        alignment: alignment,
        backgroundDecoration: backgroundDecoration,
        backgroundHeight: backgroundHeight,
        onAnimationControllerInit: onAnimationControllerInit,
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);

  _snackBarOverlayEntry[snackbarId] = overlayEntry;

  _isShowingSnackbar = false;
  return overlayEntry;
}

/// Elevarm UI's SnackBar component widget.
class ElevarmSnackBar extends StatefulWidget {
  /// Leading icon asset name.
  final IconData iconAssetName;

  /// Leading icon color.
  final Color iconColor;

  /// The SnackBar content title.
  final String title;

  /// The SnackBar content subtitle.
  final String? subtitle;

  /// The SnackBar positive button text.
  final String? positiveText;

  /// The SnackBar negative button text.
  final String? negativeText;

  /// Callback when pressing positive button.
  final void Function(AnimationController?)? onPositiveButton;

  /// Callback when pressing negative button.
  final void Function(AnimationController?)? onNegativeButton;

  /// Callback when pressing close button.
  final void Function(AnimationController?)? onCloseButton;

  /// The SnackBar maximum width.
  final double? maxWidth;

  /// The SnackBar alignment.
  final Alignment alignment;

  /// The SnackBar animation duration.
  final Duration duration;

  /// The SnackBar reverse animation duration.
  final Duration reverseDuration;

  /// The SnackBar dismiss duration.
  final Duration dismissDuration;

  /// The SnackBar background decoration.
  final BoxDecoration backgroundDecoration;

  /// The SnackBar background height.
  final double backgroundHeight;

  /// The callback to retrieve SnackBar AnimationController.
  final void Function(AnimationController)? onAnimationControllerInit;

  /// Internal id for dismissing the snackbar.
  final String snackbarId;

  const ElevarmSnackBar({
    required this.snackbarId,
    required this.iconAssetName,
    required this.iconColor,
    required this.title,
    required this.onCloseButton,
    this.subtitle,
    this.positiveText,
    this.negativeText,
    this.onPositiveButton,
    this.onNegativeButton,
    this.duration = const Duration(seconds: 1),
    this.reverseDuration = const Duration(seconds: 1),
    this.dismissDuration = const Duration(seconds: 5),
    this.maxWidth,
    this.alignment = Alignment.topCenter,
    this.backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(16, 24, 40, 0.35),
          Color.fromRGBO(255, 255, 255, 0),
        ],
      ),
    ),
    this.backgroundHeight = 150.0,
    this.onAnimationControllerInit,
    super.key,
  });

  @override
  State<ElevarmSnackBar> createState() => _ElevarmSnackBarState();
}

class _ElevarmSnackBarState extends State<ElevarmSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _snackBarAnimationController;
  late Animation<Offset> _snackBarOffsetAnimation;
  Timer? _snackBarTimer;

  @override
  void initState() {
    super.initState();

    _snackBarAnimationController = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _snackBarTimer = Timer(widget.dismissDuration, () {
              if (mounted) {
                _snackBarAnimationController.reverse();
              }
            });
          }
          if (status == AnimationStatus.dismissed) {
            if (_snackBarOverlayEntry.containsKey(widget.snackbarId)) {
              _snackBarOverlayEntry[widget.snackbarId]?.remove();
              _snackBarOverlayEntry.remove(widget.snackbarId);
            }
            if (mounted) {
              setState(() {
                _snackBarTimer?.cancel();
                _snackBarTimer = null;
              });
            }
          }
        },
      );

    _snackBarOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _snackBarAnimationController,
        curve: Curves.easeIn,
      ),
    );

    widget.onAnimationControllerInit?.call(_snackBarAnimationController);

    if (mounted) {
      _snackBarAnimationController.forward();
    }
  }

  @override
  void dispose() {
    _snackBarAnimationController.dispose();
    _snackBarTimer?.cancel();
    _snackBarTimer = null;
    if (_snackBarOverlayEntry.containsKey(widget.snackbarId)) {
      _snackBarOverlayEntry[widget.snackbarId]?.remove();
      _snackBarOverlayEntry.remove(widget.snackbarId);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Stack(
        children: [
          Align(
            alignment: widget.alignment,
            child: Container(
              decoration: widget.backgroundDecoration,
              height: widget.backgroundHeight,
              width: double.infinity,
              constraints: widget.maxWidth != null
                  ? BoxConstraints(
                      maxWidth: widget.maxWidth! + 16.0,
                    )
                  : null,
            ),
          ),
          SlideTransition(
            position: _snackBarOffsetAnimation,
            child: Align(
              alignment: widget.alignment,
              child: Container(
                constraints: widget.maxWidth != null
                    ? BoxConstraints(
                        maxWidth: widget.maxWidth!,
                      )
                    : null,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 16.0 + topPadding,
                    bottom: 16.0,
                  ),
                  child: ElevarmSnackBarContent(
                    iconAssetName: widget.iconAssetName,
                    iconColor: widget.iconColor,
                    title: widget.title,
                    subtitle: widget.subtitle,
                    positiveText: widget.positiveText,
                    negativeText: widget.negativeText,
                    onPositiveButton: widget.onPositiveButton != null
                        ? () {
                            widget.onPositiveButton!(
                              _snackBarAnimationController,
                            );
                          }
                        : null,
                    onNegativeButton: widget.onNegativeButton != null
                        ? () {
                            widget.onNegativeButton!(
                              _snackBarAnimationController,
                            );
                          }
                        : null,
                    onCloseButton: widget.onCloseButton != null
                        ? () {
                            widget.onCloseButton!(
                              _snackBarAnimationController,
                            );
                          }
                        : () {
                            _snackBarAnimationController.reverse();
                          },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
