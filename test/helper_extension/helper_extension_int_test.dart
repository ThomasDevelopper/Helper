import 'package:flutter_test/flutter_test.dart';
import 'package:helper/helper.dart';

void main()
{
  test("Test transform a number in string", () {
    // Expectations
    expect(1500.toStringLikeSocialMedia(), "1,50 K");
    expect(1560.toStringLikeSocialMedia(), "1,56 K");
    expect(750.toStringLikeSocialMedia(), "750");
    expect(1200000.toStringLikeSocialMedia(), "1,20 M");
    expect(1204560.toStringLikeSocialMedia(), "1,20 M");
  });
}