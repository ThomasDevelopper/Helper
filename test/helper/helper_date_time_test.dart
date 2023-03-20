import 'package:flutter_test/flutter_test.dart';
import 'package:helper/src/helper/helper_date_time.dart';

void main()
{
  final dt = DateTime(2023, 04, 19, 10, 05, 35);

  test("Test convert a dateTime to string", () {
    // Create an instance
    final helperDateTime = HelperDateTime(dt);
    // Expectation
    expect(helperDateTime.dateTimeToString(), "2023-04-19 10:05:35");
  });

  test("Test add a duration", () {
    // Create an instance
    final helperDateTime = HelperDateTime(dt);
    // Create a new DateTime 4 days after
    DateTime dt4DaysAfter = DateTime(dt.year, dt.month, dt.day+4, dt.hour, dt.minute, dt.second);
    expect(helperDateTime.addDuration(days: 4), dt4DaysAfter);
    // Create a new DateTime 10 hours after
    DateTime dt10HoursAfter = DateTime(dt.year, dt.month, dt.day, dt.hour+10, dt.minute, dt.second);
    expect(helperDateTime.addDuration(hours: 10), dt10HoursAfter);
    // Create a new DateTime 30 minutes after
    DateTime dt30MinAfter = DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute+30, dt.second);
    expect(helperDateTime.addDuration(minutes: 30), dt30MinAfter);
    // Create a new DateTime 20 seconds after
    DateTime dt20SecAfter = DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second+20);
    expect(helperDateTime.addDuration(seconds: 20), dt20SecAfter);
  });

  test("Test remove a duration", () {
    // Create an instance
    final helperDateTime = HelperDateTime(dt);
    // Create a new DateTime 3 days before
    DateTime dt3DaysBefore = DateTime(dt.year, dt.month, dt.day-3, dt.hour, dt.minute, dt.second);
    expect(helperDateTime.removeDuration(days: 3), dt3DaysBefore);
    // Create a new DateTime 7 hours before
    DateTime dt7HoursBefore = DateTime(dt.year, dt.month, dt.day, dt.hour-7, dt.minute, dt.second);
    expect(helperDateTime.removeDuration(hours: 7), dt7HoursBefore);
    // Create a new DateTime 2 minutes before
    DateTime dt2MinBefore = DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute-2, dt.second);
    expect(helperDateTime.removeDuration(minutes: 2), dt2MinBefore);
    // Create a new DateTime 30 seconds before
    DateTime dt30SecBefore = DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second-30);
    expect(helperDateTime.removeDuration(seconds: 30), dt30SecBefore);
  });
}