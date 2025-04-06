import 'dart:ui';

extension ElevarmColorsExt on Color {
  String toHexString() {
    // ignore: deprecated_member_use
    String hex = value.toRadixString(16);
    return hex.toUpperCase();
  }
}
