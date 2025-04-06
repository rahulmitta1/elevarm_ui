import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [LinearProgressIndicator] widget that has rounded border.
class ElevarmLinearProgressIndicator extends ProgressIndicator {
  /// Border radius.
  final double borderRadius;

  /// The same as [LinearProgressIndicator.minHeight].
  final double? minHeight;

  const ElevarmLinearProgressIndicator({
    super.key,
    super.value,
    // ignore: deprecated_member_use_from_same_package
    super.backgroundColor = ElevarmColors.grey200, // FIXME
    super.color = ElevarmColors.success,
    super.valueColor,
    super.semanticsLabel,
    super.semanticsValue,
    this.minHeight = 8.0,
    this.borderRadius = ElevarmBorderRadius.sm,
  }) : assert(minHeight == null || minHeight > 0);

  @override
  State<ElevarmLinearProgressIndicator> createState() =>
      _ElevarmLinearProgressIndicatorState();

  Widget _buildSemanticsWrapper({
    required BuildContext context,
    required Widget child,
  }) {
    String? expandedSemanticsValue = semanticsValue;
    if (value != null) {
      expandedSemanticsValue ??= '${(value! * 100).round()}%';
    }
    return Semantics(
      label: semanticsLabel,
      value: expandedSemanticsValue,
      child: child,
    );
  }

  Color _getValueColor(BuildContext context) {
    return valueColor?.value ??
        color ??
        ProgressIndicatorTheme.of(context).color ??
        Theme.of(context).colorScheme.primary;
  }
}

class _ElevarmLinearProgressIndicatorState
    extends State<ElevarmLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double get borderRadius => widget.borderRadius;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateLinearDuration),
      vsync: this,
    );
    if (widget.value == null) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(ElevarmLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating) {
      _controller.repeat();
    } else if (widget.value != null && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator(
    BuildContext context,
    double animationValue,
    TextDirection textDirection,
  ) {
    final ProgressIndicatorThemeData indicatorTheme =
        ProgressIndicatorTheme.of(context);
    final Color trackColor = widget.backgroundColor ??
        indicatorTheme.linearTrackColor ??
        Theme.of(context).colorScheme.surface;
    final double minHeight =
        widget.minHeight ?? indicatorTheme.linearMinHeight ?? 4.0;

    return widget._buildSemanticsWrapper(
      context: context,
      child: Container(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: minHeight,
        ),
        child: CustomPaint(
          painter: _ElevarmLinearProgressIndicatorPainter(
            backgroundColor: trackColor,
            valueColor: widget._getValueColor(context),
            value: widget.value, // may be null
            animationValue:
                _controller.value, // ignored if widget.value is not null
            textDirection: textDirection,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);

    if (widget.value != null) {
      return _buildIndicator(context, _controller.value, textDirection);
    }

    return AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget? child) {
        return _buildIndicator(context, _controller.value, textDirection);
      },
    );
  }
}

const int _kIndeterminateLinearDuration = 1800;

/// Taken from [LinearProgressIndicator]'s painter
/// and customized so that the bar is rounded.
class _ElevarmLinearProgressIndicatorPainter extends CustomPainter {
  const _ElevarmLinearProgressIndicatorPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.animationValue,
    required this.textDirection,
    required this.borderRadius,
    this.value,
  });

  final Color backgroundColor;
  final Color valueColor;
  final double? value;
  final double animationValue;
  final TextDirection textDirection;
  final double borderRadius;

  // The indeterminate progress animation displays two lines whose leading
  // (head) and trailing (tail) endpoints are defined by the following four
  // curves.
  static const Curve line1Head = Interval(
    0.0,
    750.0 / _kIndeterminateLinearDuration,
    curve: Cubic(0.2, 0.0, 0.8, 1.0),
  );
  static const Curve line1Tail = Interval(
    333.0 / _kIndeterminateLinearDuration,
    (333.0 + 750.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.4, 0.0, 1.0, 1.0),
  );
  static const Curve line2Head = Interval(
    1000.0 / _kIndeterminateLinearDuration,
    (1000.0 + 567.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.0, 0.0, 0.65, 1.0),
  );
  static const Curve line2Tail = Interval(
    1267.0 / _kIndeterminateLinearDuration,
    (1267.0 + 533.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.10, 0.0, 0.45, 1.0),
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Offset.zero & size,
        Radius.circular(borderRadius),
      ),
      paint,
    );

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) {
        return;
      }

      final double left;
      switch (textDirection) {
        case TextDirection.rtl:
          left = size.width - width - x;
          break;
        case TextDirection.ltr:
          left = x;
          break;
      }
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Offset(left, 0.0) & Size(width, size.height),
          Radius.circular(borderRadius),
        ),
        paint,
      );
    }

    if (value != null) {
      drawBar(0.0, clampDouble(value!, 0.0, 1.0) * size.width);
    } else {
      final double x1 = size.width * line1Tail.transform(animationValue);
      final double width1 =
          size.width * line1Head.transform(animationValue) - x1;

      final double x2 = size.width * line2Tail.transform(animationValue);
      final double width2 =
          size.width * line2Head.transform(animationValue) - x2;

      drawBar(x1, width1);
      drawBar(x2, width2);
    }
  }

  @override
  bool shouldRepaint(_ElevarmLinearProgressIndicatorPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.value != value ||
        oldPainter.animationValue != animationValue ||
        oldPainter.textDirection != textDirection;
  }
}
