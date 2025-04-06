import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';

/// Possible height values for buttons.
class ElevarmButtonHeights {
  /// Small (SM) button height.
  static const sm = 36.0;

  /// Medium (MD) button height.
  static const md = 40.0;

  /// Large (LG) button height.
  static const lg = 44.0;

  /// Extra Large (XL) button height.
  static const xl = 48.0;

  /// Extra Large 2 (2XL) button height.
  static const xl2 = 60.0;
}

/// Possible text font size for buttons.
class ElevarmButtonTextFontSize {
  /// Small (SM) button text font size.
  static const sm = ElevarmFontSizes.sm;

  /// Medium (MD) button text font size.
  static const md = ElevarmFontSizes.sm;

  /// Large (LG) button text font size.
  static const lg = ElevarmFontSizes.md;

  /// Extra Large (XL) button text font size.
  static const xl = ElevarmFontSizes.md;

  /// Extra Large 2 (2XL) button text font size.
  static const xl2 = ElevarmFontSizes.lg;

  /// Get [ElevarmButtonTextFontSize] value from [ElevarmButtonHeights].
  static double fromButtonHeights(double buttonHeights) {
    if (buttonHeights <= ElevarmButtonHeights.sm) {
      return sm;
    } else if (buttonHeights <= ElevarmButtonHeights.md) {
      return md;
    } else if (buttonHeights <= ElevarmButtonHeights.lg) {
      return lg;
    } else if (buttonHeights <= ElevarmButtonHeights.xl) {
      return xl;
    } else {
      return xl2;
    }
  }
}

/// Possible content padding for buttons.
class ElevarmButtonPadding {
  /// Small (SM) button content padding.
  static const sm = EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 14.0,
  );

  /// Medium (MD) button content padding.
  static const md = EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 16.0,
  );

  /// Large (LG) button content padding.
  static const lg = EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 18.0,
  );

  /// Extra Large (XL) button content padding.
  static const xl = EdgeInsets.symmetric(
    vertical: 12.0,
    horizontal: 20.0,
  );

  /// Extra Large 2 (2XL) button content padding.
  static const xl2 = EdgeInsets.symmetric(
    vertical: 16.0,
    horizontal: 28.0,
  );

  /// Get [ElevarmButtonPadding] value from [ElevarmButtonHeights].
  static EdgeInsetsGeometry fromButtonHeights(double buttonHeights) {
    if (buttonHeights <= ElevarmButtonHeights.sm) {
      return sm;
    } else if (buttonHeights <= ElevarmButtonHeights.md) {
      return md;
    } else if (buttonHeights <= ElevarmButtonHeights.lg) {
      return lg;
    } else if (buttonHeights <= ElevarmButtonHeights.xl) {
      return xl;
    } else {
      return xl2;
    }
  }
}

/// Possible content padding for icon-only buttons.
class ElevarmButtonIconOnlyPadding {
  /// Small (SM) icon-only button content padding.
  static const sm = EdgeInsets.all(8.0);

  /// Medium (MD) icon-only button content padding.
  static const md = EdgeInsets.all(10.0);

  /// Large (LG) icon-only button content padding.
  static const lg = EdgeInsets.all(12.0);

  /// Extra Large (XL) icon-only button content padding.
  static const xl = EdgeInsets.all(14.0);

  /// Extra Large 2 (2XL) icon-only button content padding.
  static const xl2 = EdgeInsets.all(16.0);

  /// Get [ElevarmButtonIconOnlyPadding] value from [ElevarmButtonHeights].
  static EdgeInsetsGeometry fromButtonHeights(double buttonHeights) {
    if (buttonHeights <= ElevarmButtonHeights.sm) {
      return sm;
    } else if (buttonHeights <= ElevarmButtonHeights.md) {
      return md;
    } else if (buttonHeights <= ElevarmButtonHeights.lg) {
      return lg;
    } else if (buttonHeights <= ElevarmButtonHeights.xl) {
      return xl;
    } else {
      return xl2;
    }
  }
}

/// Possible icon size for buttons.
class ElevarmButtonIconSize {
  /// Get [ElevarmButtonIconSize] value from [ElevarmButtonHeights].
  static double fromButtonHeights(double buttonHeights) {
    if (buttonHeights <= ElevarmButtonHeights.xl) {
      return 20.0;
    } else {
      return 24.0;
    }
  }
}
