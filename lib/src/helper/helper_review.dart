library helper;

import 'package:flutter/cupertino.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class to help the developer to display a review in app,
/// this is used to encourage users to rate the application on the stores.
class HelperReview
{
  static late HelperReview _instance;

  /// Boolean to know if the review was already request.
  bool _alreadyFetch = false;

  HelperReview._();

  /// Initialize [_instance].
  static void initialize() {
    // Set the instance
    _instance = HelperReview._();
  }

  /// Function to verify that we need to display the request for review.
  Future<bool> _needDisplayRequest({
    int fromHowMuchOpening = 3,
    int intervalOfAskingForIOS = 3
  }) async {
    // Initialize the boolean needDisplay
    bool needDisplay = false;
    // Get the instance of SharedPreferences
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Get the number of times the app was opened (from SharedPreferences)
    int nbTimesAppOpened = preferences.getInt('nb_open_app_for_review') ?? 0;
    // Increment the value
    nbTimesAppOpened++;
    // Re-write the value
    await preferences.setInt('nb_open_app_for_review', nbTimesAppOpened);
    // If this value % the interval equal to 0
    if(nbTimesAppOpened >= fromHowMuchOpening && nbTimesAppOpened%intervalOfAskingForIOS == 0){
      // Set needDisplay boolean to true
      needDisplay = true;
    }
    return needDisplay;
  }

  /// Function to ask review to the user.
  ///
  /// If [fromHowMuchOpening] is set to 3,
  /// it will ask the API to display the window after the 3rd launch of the application.
  ///
  /// If [intervalOfAskingForIOS] is set to 3,
  /// it will ask the API to display the widow every 3 openings of the application,
  /// until the user notes the app (IOS only).
  Future<void> askReview({
    int fromHowMuchOpening = 3,
    int intervalOfAskingForIOS = 3
  }) async {
    // If the review was not already fetch
    if(!_alreadyFetch){
      // Set alreadyFetch bool to true
      _alreadyFetch = true;
      // Get the instance of InAppReview
      final InAppReview inAppReview = InAppReview.instance;
      // If it's available and we can request
      if(await inAppReview.isAvailable() && await _needDisplayRequest(fromHowMuchOpening: fromHowMuchOpening, intervalOfAskingForIOS: intervalOfAskingForIOS)){
        // Request the review by the user
        await inAppReview.requestReview();
      }
    }
  }

  static HelperReview get instance => _instance;

  @visibleForTesting
  Future<bool> needDisplayRequest({int fromHowMuchOpening = 3, int intervalOfAskingForIOS = 3}) =>
      _needDisplayRequest(fromHowMuchOpening: fromHowMuchOpening, intervalOfAskingForIOS: intervalOfAskingForIOS);
}