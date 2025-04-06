import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ElevarmFontWeights', () {
    test('font weights', () {
      expect(ElevarmFontWeights.regular, FontWeight.w400);
      expect(ElevarmFontWeights.medium, FontWeight.w500);
      expect(ElevarmFontWeights.semibold, FontWeight.w600);
      expect(ElevarmFontWeights.bold, FontWeight.w700);
    });
  });
}
