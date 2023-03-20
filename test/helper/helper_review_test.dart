import 'package:flutter_test/flutter_test.dart';
import 'package:helper/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  group("Test needDisplayRequest function", () {

    setUpAll(() => HelperReview.initialize());

    test("Test needDisplayRequest return true", () async {
      // Set mock values
      SharedPreferences.setMockInitialValues({'nb_open_app_for_review': 2});
      // Expect that we need the display the request
      expect(await HelperReview.instance.needDisplayRequest(intervalOfAskingForIOS: 1), true);
      // Set mock values
      SharedPreferences.setMockInitialValues({'nb_open_app_for_review': 7});
      // Expect that we need the display the request
      expect(await HelperReview.instance.needDisplayRequest(fromHowMuchOpening: 8, intervalOfAskingForIOS: 4), true);
    });

    test("Test needDisplayRequest return false", () async {
      // Set mock values
      SharedPreferences.setMockInitialValues({'nb_open_app_for_review': 3});
      // Expect that we need the display the request
      expect(await HelperReview.instance.needDisplayRequest(fromHowMuchOpening: 1, intervalOfAskingForIOS: 3), false);
      // Set mock values
      SharedPreferences.setMockInitialValues({'nb_open_app_for_review': 9});
      // Expect that we need the display the request
      expect(await HelperReview.instance.needDisplayRequest(fromHowMuchOpening: 8, intervalOfAskingForIOS: 4), false);
      // Set mock values
      SharedPreferences.setMockInitialValues({'nb_open_app_for_review': 5});
      // Expect that we need the display the request
      expect(await HelperReview.instance.needDisplayRequest(fromHowMuchOpening: 1, intervalOfAskingForIOS: 4), false);
    });
  });
}