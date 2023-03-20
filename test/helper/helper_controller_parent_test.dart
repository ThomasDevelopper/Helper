import 'package:flutter_test/flutter_test.dart';
import 'package:helper/src/helper/helper_controller_parent.dart';

class TestHelperController extends HelperControllerParent {}

void main()
{
  test("Test future int for test", () async {
    TestHelperController testHelperController = TestHelperController();
    // Expectations
    expect(await testHelperController.createFutureIntForTest(), 1);
    expect(await testHelperController.createFutureIntForTest(intReturn: 4), 4);
    expect(await testHelperController.createFutureIntForTest(intReturn: 9), 9);
  });

  test("Test future string for test", () async {
    TestHelperController testHelperController = TestHelperController();
    // Expectations
    expect(await testHelperController.createFutureStringForTest(), "OK");
    expect(await testHelperController.createFutureStringForTest(returnNOK: true), "NOK");
    expect(await testHelperController.createFutureStringForTest(returnNOK: false), "OK");
  });

  test("inTesting booleans", () {
    TestHelperController testHelperController = TestHelperController();
    // Expectations
    expect(testHelperController.inTesting, true);
    expect(HelperControllerParent.inTestingStatic, true);
  });
}