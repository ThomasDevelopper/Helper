import 'package:flutter_test/flutter_test.dart';
import 'package:helper/helper.dart';

void main() {

  group("Test toStringSmallFormat function", () {
    test("Test with hours, minutes and seconds", () {
      // Expectations
      expect(const Duration(hours: 2, minutes: 45, seconds: 25).toStringSmallFormat(), "2h 45m 25s");
      expect(const Duration(hours: 22, minutes: 60, seconds: 00).toStringSmallFormat(), "23h");
    });

    test("Test with minutes and seconds only", () {
      // Expectations
      expect(const Duration(minutes: 45, seconds: 25).toStringSmallFormat(), "45m 25s");
      expect(const Duration(minutes: 22).toStringSmallFormat(), "22m");
      expect(const Duration(minutes: 23, seconds: 60).toStringSmallFormat(), "24m");
      expect(const Duration(seconds: 120).toStringSmallFormat(), "2m");
    });

    test("Test with seconds only", () {
      // Expectations
      expect(const Duration(seconds: 12).toStringSmallFormat(), "12s");
      expect(const Duration(seconds: 25).toStringSmallFormat(), "25s");
      expect(const Duration(seconds: 280).toStringSmallFormat(), "4m 40s");
    });
  });

}