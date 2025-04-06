// ignore_for_file: deprecated_member_use_from_same_package

import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ElevarmColors', () {
    test('neutral colors', () {
      expect(ElevarmColors.neutral50.toHexString(), 'FFF3F4F5');
      expect(ElevarmColors.neutral100.toHexString(), 'FFE7E8EA');
      expect(ElevarmColors.neutral200.toHexString(), 'FFB1B4B9');
      expect(ElevarmColors.neutral300.toHexString(), 'FF7C8089');
      expect(ElevarmColors.neutral400.toHexString(), 'FF464C58');
      expect(ElevarmColors.neutral500.toHexString(), 'FF101828');
      expect(ElevarmColors.neutral, ElevarmColors.neutral500);
    });

    test('white color', () {
      expect(ElevarmColors.white.toHexString(), 'FFFFFFFF');
    });

    test('grey colors', () {
      expect(ElevarmColors.grey25.toHexString(), 'FFFCFCFD');
      expect(ElevarmColors.grey100.toHexString(), 'FFF2F4F7');
      expect(ElevarmColors.grey200.toHexString(), 'FFEAECF0');
      expect(ElevarmColors.grey300.toHexString(), 'FFD0D5DD');
      expect(ElevarmColors.grey500.toHexString(), 'FF667085');
      expect(ElevarmColors.grey600.toHexString(), 'FF475467');
      expect(ElevarmColors.grey700.toHexString(), 'FF344054');
      expect(ElevarmColors.grey900.toHexString(), 'FF101828');
      expect(ElevarmColors.grey, ElevarmColors.grey500);
    });

    test('primary colors', () {
      expect(ElevarmColors.primary100.toHexString(), 'FFEAECF9');
      expect(ElevarmColors.primary200.toHexString(), 'FFB9C0EA');
      expect(ElevarmColors.primary300.toHexString(), 'FF8995DC');
      expect(ElevarmColors.primary400.toHexString(), 'FF5869CD');
      expect(ElevarmColors.primary500.toHexString(), 'FF283EBF');
      expect(ElevarmColors.primary600.toHexString(), 'FF2235A4');
      expect(ElevarmColors.primary700.toHexString(), 'FF1D2D8A');
      expect(ElevarmColors.primary800.toHexString(), 'FF17246F');
      expect(ElevarmColors.primary900.toHexString(), 'FF121B54');
      expect(ElevarmColors.primary, ElevarmColors.primary500);
    });

    test('info colors', () {
      expect(ElevarmColors.info100.toHexString(), 'FFE6F1FC');
      expect(ElevarmColors.info200.toHexString(), 'FFADD1F6');
      expect(ElevarmColors.info300.toHexString(), 'FF75B0EF');
      expect(ElevarmColors.info400.toHexString(), 'FF3D90E9');
      expect(ElevarmColors.info500.toHexString(), 'FF0470E2');
      expect(ElevarmColors.info600.toHexString(), 'FF0360C2');
      expect(ElevarmColors.info700.toHexString(), 'FF0351A3');
      expect(ElevarmColors.info800.toHexString(), 'FF024183');
      expect(ElevarmColors.info900.toHexString(), 'FF023163');
      expect(ElevarmColors.info, ElevarmColors.info500);
    });

    test('success colors', () {
      expect(ElevarmColors.success50.toHexString(), 'FFECFDF3');
      expect(ElevarmColors.success100.toHexString(), 'FFE9F7E7');
      expect(ElevarmColors.success200.toHexString(), 'FFB8E4B0');
      expect(ElevarmColors.success300.toHexString(), 'FF87D179');
      expect(ElevarmColors.success400.toHexString(), 'FF55BF43');
      expect(ElevarmColors.success500.toHexString(), 'FF24AC0C');
      expect(ElevarmColors.success600.toHexString(), 'FF1F940A');
      expect(ElevarmColors.success700.toHexString(), 'FF1A7C09');
      expect(ElevarmColors.success800.toHexString(), 'FF156407');
      expect(ElevarmColors.success900.toHexString(), 'FF104C05');
      expect(ElevarmColors.success, ElevarmColors.success500);
    });

    test('warning colors', () {
      expect(ElevarmColors.warning100.toHexString(), 'FFFFF7E6');
      expect(ElevarmColors.warning200.toHexString(), 'FFFEE3AE');
      expect(ElevarmColors.warning300.toHexString(), 'FFFDD077');
      expect(ElevarmColors.warning400.toHexString(), 'FFFDBD3F');
      expect(ElevarmColors.warning500.toHexString(), 'FFFCAA07');
      expect(ElevarmColors.warning600.toHexString(), 'FFD99206');
      expect(ElevarmColors.warning700.toHexString(), 'FFB57A05');
      expect(ElevarmColors.warning800.toHexString(), 'FF926304');
      expect(ElevarmColors.warning900.toHexString(), 'FF6F4B03');
      expect(ElevarmColors.warning, ElevarmColors.warning500);
    });

    test('danger colors', () {
      expect(ElevarmColors.danger50.toHexString(), 'FFFEF3F2');
      expect(ElevarmColors.danger100.toHexString(), 'FFFAEBEC');
      expect(ElevarmColors.danger200.toHexString(), 'FFEFBDC0');
      expect(ElevarmColors.danger300.toHexString(), 'FFE49094');
      expect(ElevarmColors.danger400.toHexString(), 'FFD86268');
      expect(ElevarmColors.danger500.toHexString(), 'FFCD353C');
      expect(ElevarmColors.danger600.toHexString(), 'FFB02E34');
      expect(ElevarmColors.danger700.toHexString(), 'FF94262B');
      expect(ElevarmColors.danger800.toHexString(), 'FF771F23');
      expect(ElevarmColors.danger900.toHexString(), 'FF5A171A');
      expect(ElevarmColors.danger, ElevarmColors.danger500);
    });
  });
}
