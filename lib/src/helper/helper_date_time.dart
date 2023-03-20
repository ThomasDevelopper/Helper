library helper;

import 'package:intl/intl.dart';

/// Class to help the developer to manage the DateTime.
class HelperDateTime {

  late DateTime _dateTime;

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
}