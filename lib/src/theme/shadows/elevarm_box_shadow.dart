import 'package:flutter/material.dart';

/// Elevarm UI box shadow values.
class ElevarmBoxShadow {
  /// Extra Small (XS) box shadow.
  static const xs = [
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.05),
      offset: Offset(0.0, 1.0),
      blurRadius: 2.0,
      spreadRadius: 0.0,
    ),
  ];

  /// Small (SM) box shadow.
  static const sm = [
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.06),
      offset: Offset(0.0, 1.0),
      blurRadius: 2.0,
      spreadRadius: 0.0,
    ),
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.1),
      offset: Offset(0.0, 1.0),
      blurRadius: 3.0,
      spreadRadius: 0.0,
    ),
  ];

  /// Medium (MD) box shadow.
  static const md = [
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.06),
      offset: Offset(0.0, 2.0),
      blurRadius: 4.0,
      spreadRadius: -2.0,
    ),
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.1),
      offset: Offset(0.0, 4.0),
      blurRadius: 8.0,
      spreadRadius: -2.0,
    ),
  ];

  /// Large (LG) box shadow.
  static const lg = [
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.03),
      offset: Offset(0.0, 4.0),
      blurRadius: 6.0,
      spreadRadius: -2.0,
    ),
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.08),
      offset: Offset(0.0, 12.0),
      blurRadius: 16.0,
      spreadRadius: -4.0,
    ),
  ];

  /// Extra Large (XL) box shadow.
  static const xl = [
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.03),
      offset: Offset(0.0, 8.0),
      blurRadius: 8.0,
      spreadRadius: -4.0,
    ),
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.08),
      offset: Offset(0.0, 20.0),
      blurRadius: 24.0,
      spreadRadius: -4.0,
    ),
  ];

  /// Extra Large 2 (2XL) box shadow.
  static const xl2 = [
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.18),
      offset: Offset(0.0, 24.0),
      blurRadius: 48.0,
      spreadRadius: -12.0,
    ),
  ];

  /// Extra Large 3 (3XL) box shadow.
  static const xl3 = [
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.14),
      offset: Offset(0.0, 32.0),
      blurRadius: 64.0,
      spreadRadius: -12.0,
    ),
  ];

  /// Extra Large 4 (4XL) box shadow.
  static const xl4 = [
    BoxShadow(
      color: Color.fromRGBO(16, 24, 40, 0.5),
      offset: Offset(0.0, 6.0),
      blurRadius: 24.0,
      spreadRadius: -12.0,
    ),
  ];
}
