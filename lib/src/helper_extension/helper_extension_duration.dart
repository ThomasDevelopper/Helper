library helper;

import 'package:helper/helper.dart';

extension HelperExtensionDuration on Duration {

  /// Function to convert a [Duration] in a [String] format.
  ///
  /// Example :
  ///
  /// ```dart
  /// Duration(hours: 2, minutes: 45, seconds: 25).toStringSmallFormat(); // "2h 45m 25s"
  /// Duration(minutes: 23, seconds: 24).toStringSmallFormat(); // "23m 24s"
  /// Duration(seconds: 12).toStringSmallFormat(); // "12s"
  /// ```
  String toStringSmallFormat() {
    // Initialize a result
    String result = "";
    // Get the number of seconds
    int seconds = inSeconds;
    // Get the number of minutes in seconds
    int minutes = seconds~/60;
    // Remove from seconds (minutes*60s)
    seconds -= minutes*60;
    // Get the number of hours in minutes
    int hour = minutes~/60;
    // Remove from minutes (hour*60m)
    minutes -= hour*60;
    // If the nb of hours is more than 0
    if(hour>0) result = "${hour}h";
    // If the nb of minutes is more than 0
    if(minutes>0) result += " ${minutes}m";
    // If the nb of seconds is more than 0
    if(seconds>0) result += " ${seconds}s";
    return result.removeUnnecessarySpaces();
  }

}