import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ElevarmFontSizes', () {
    test('font sizes', () {
      expect(ElevarmFontSizes.xl5, 48.0);
      expect(ElevarmFontSizes.xl4, 36.0);
      expect(ElevarmFontSizes.xl3, 30.0);
      expect(ElevarmFontSizes.xl2, 24.0);
      expect(ElevarmFontSizes.xl, 20.0);
      expect(ElevarmFontSizes.lg, 18.0);
      expect(ElevarmFontSizes.md, 16.0);
      expect(ElevarmFontSizes.sm, 14.0);
      expect(ElevarmFontSizes.xs, 12.0);
    });
  });
}
