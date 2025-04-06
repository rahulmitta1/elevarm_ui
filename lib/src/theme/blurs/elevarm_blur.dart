import 'dart:ui';
import 'package:flutter/material.dart';

/// [ElevarmBlur] sizes.
class ElevarmBlurSizes {
  static const xs = 8.0;
  static const sm = 16.0;
  static const md = 24.0;
  static const lg = 40.0;
}

/// Inspired by and modified from `blur` package by jagritjkh (MIT License)
///
/// See: https://github.com/jagritjkh/blur
/// blur it's [child]
/// [blur] is the value of blur effect, higher the blur more the blur effect
/// [blurColor] is the color of blur effect (default value = Colors.white)
/// [borderRadius] is the radius of the child to be blurred
/// [overlay] is the widget that can be stacked over blurred widget
/// [alignment] is the alignment geometry of the overlay (default value =
/// Alignment.center)
class ElevarmBlur extends StatelessWidget {
  const ElevarmBlur({
    required this.child,
    this.blur = ElevarmBlurSizes.md,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.overlay,
    this.alignment = Alignment.center,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double blur;
  final Color blurColor;
  final BorderRadius? borderRadius;
  final Widget? overlay;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                decoration: BoxDecoration(
                  color: blurColor,
                ),
                alignment: alignment,
                child: overlay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Extension of [ElevarmBlur] on [Widget] to blur it's child
/// same as a [ElevarmBlur] widget but you can use this as an extension on
/// any widget which you want to have a blur effect
/// blur is the value of blur effect, higher the blur more the blur effect
extension BlurExtension on Widget {
  ElevarmBlur blurred({
    double blur = ElevarmBlurSizes.md,
    Color blurColor = Colors.white,
    BorderRadius? borderRadius,
    Widget? overlay,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return ElevarmBlur(
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      overlay: overlay,
      alignment: alignment,
      child: this,
    );
  }
}
