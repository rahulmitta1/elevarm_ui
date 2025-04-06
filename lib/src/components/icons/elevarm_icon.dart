import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// App's standardized icon widget.
class ElevarmIcon extends Icon {
  /// Constructor fot Elevarm icons.
  const ElevarmIcon(
    super.icon, {
    Key? key,
    double? size = 20.0,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    // ignore: deprecated_member_use_from_same_package
    Color? color = ElevarmColors.grey700,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
  }) : super(
          key: key,
          size: size,
          fill: fill,
          weight: weight,
          grade: grade,
          opticalSize: opticalSize,
          color: color,
          shadows: shadows,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        );
}
