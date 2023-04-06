library helper;

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

/// Class to help the developer to manage the DateTime.
class HelperDateTime {

  late DateTime _dateTime;

  late DateTime _now = getCurrentDateTime();

  /// Constructor of the class
  ///
  /// if none [dateTime] was given, [_dateTime] is set to now
  HelperDateTime(DateTime? dateTime){
    // Set the _dateTime
    _dateTime = dateTime ?? DateTime.now();
  }

  /// Function to get the current DateTime.
  ///
  /// Return [_dateTime] in "yyyy-MM-dd HH:mm:ss" format.
  /// For example : 2023-05-20 10:00:00.
  static DateTime getCurrentDateTime() {
    // Set the DateTime in the specific format
    String nowInString = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    // Convert the format in DateTime
    return DateTime.parse(nowInString);
  }

  /// Function to get the current DateTime in String
  ///
  /// Return [_dateTime] in "yyyy-MM-dd HH:mm:ss" format.
  /// For example : "2023-05-20 10:00:00".
  static String getCurrentDateTimeInString() =>
      DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

  /// Function to convert [_dateTime] in string with format "yyyy-MM-dd HH:mm:ss".
  String dateTimeToString() =>
      DateFormat("yyyy-MM-dd HH:mm:ss").format(_dateTime);

  /// Function to add a new duration to [_dateTime].
  ///
  /// - [days] is the number of days to add.
  /// - [hours] is the number of hours to add.
  /// - [minutes] is the number of minutes to add.
  /// - [seconds] is the number of seconds to add.
  DateTime addDuration({
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0
  }) {
    // Initialize a DateTime to now
    DateTime newDateTime = _dateTime;
    // Modify the newDateTime
    newDateTime = newDateTime.add(
        Duration(days: days, hours: hours, minutes: minutes, seconds: seconds)
    );
    // Return the newDateTime modified
    return newDateTime;
  }

  /// Function to remove a new duration to [_dateTime].
  ///
  /// - [days] is the number of days to remove.
  /// - [hours] is the number of hours to remove.
  /// - [minutes] is the number of minutes to remove.
  /// - [seconds] is the number of seconds to remove.
  DateTime removeDuration({
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0
  }) {
    // Initialize a DateTime to now
    DateTime newDateTime = _dateTime;
    // Modify the newDateTime
    newDateTime = newDateTime.subtract(
        Duration(days: days, hours: hours, minutes: minutes, seconds: seconds)
    );
    // Return the newDateTime modified
    return newDateTime;
  }

  /// Function to display the difference between [_dateTime] and now in [String].
  ///
  /// All functions in the parameters are used liked this :
  ///
  /// ```dart
  /// yearString: (nbYear) => nbYear>1? years : year;
  /// ```
  ///
  /// If the difference is for example 10 hours and 25 minutes
  /// it will display only 10 hours.
  String toStringSmallFormat({
    required String Function(int nbMonth) yearString,
    required String Function(int nbMonth) monthString,
    required String Function(int nbDay) dayString,
    required String Function(int nbHours) hourString,
    required String Function(int nbMin) minuteString,
    required String nowString,
  }) {
    String result;
    // Get the current DateTime
    DateTime now = _now;
    // Get the difference between _dateTime and now
    Duration difference = _dateTime.difference(now).abs();
    // If the difference is more than 1 day
    if(difference.inDays>0) {
      // If the difference is more than 365 days (one year)
      if(difference.inDays>365) {
        // Get the number of years
        int years = difference.inDays~/365;
        result = "$years ${yearString(years)}";
      }
      // If the difference is more than 29 days
      else if(difference.inDays>29) {
        // Get the number of months
        int months = difference.inDays~/30;
        result = "$months ${monthString(months)}";
      }
      // Else if the difference is equal or less than 29 days
      else {
        // Get the number of days
        int days = difference.inDays;
        result = "$days ${dayString(days)}";
      }
    }
    else {
      // Get the difference in hours
      int hours = difference.inHours;
      // If the number of hour is 1 or more
      if(hours>0) {
        result = "$hours ${hourString(hours)}";
      }
      else {
        // Get the difference in minutes
        int minutes = difference.inMinutes;
        // If the number of minutes is superior superior or equal to 1
        if(minutes>0){
          result = "$minutes ${minuteString(minutes)}";
        }
        // If the number of minute is 0
        else{
          result = nowString;
        }
      }
    }
    return result;
  }


  /// Function to test [toStringSmallFormat].
  ///
  /// We re-set [_now] by [now] for testing.
  @visibleForTesting
  String toStringSmallFormatTesting({
    required DateTime now,
    required String Function(int nbMonth) yearString,
    required String Function(int nbMonth) monthString,
    required String Function(int nbDay) dayString,
    required String Function(int nbHours) hourString,
    required String Function(int nbMin) minuteString,
    required String nowString,
  }) {
    _now = now;
    return toStringSmallFormat(
        yearString: yearString,
        monthString: monthString,
        dayString: dayString,
        hourString: hourString,
        minuteString: minuteString,
        nowString: nowString
    );
  }
}