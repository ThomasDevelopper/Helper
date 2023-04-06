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




  group("Test toStringSmallFormat", () {
    // Optimize the function
    String toStringForTest(HelperDateTime helperDateTime) => helperDateTime.toStringSmallFormatTesting(
        now: DateTime(2023, 04, 06, 14, 20, 25),
        yearString: (nbYear) => nbYear>1? "years" : "year",
        monthString: (nbMonth) => nbMonth>1? "months" : "month",
        dayString: (nbDay) => nbDay>1? "days" : "day",
        hourString: (nbHour) => nbHour>1? "hours" : "hour",
        minuteString: (nbMinute) => nbMinute>1? "minutes" : "minute",
        nowString: "now"
    );

    test("Test display year", () {
      // Create an instance
      HelperDateTime helperDateTime = HelperDateTime(DateTime(2021));
      // Expectation
      expect(toStringForTest(helperDateTime), "2 years");
      // Create an instance
      helperDateTime = HelperDateTime(DateTime(2022));
      // Expectation
      expect(toStringForTest(helperDateTime), "1 year");
    });

    test("Test display month", () {
      // Create an instance
      HelperDateTime helperDateTime = HelperDateTime(DateTime(2023, 01));
      // Expectation
      expect(toStringForTest(helperDateTime), "3 months");
      // Create an instance
      helperDateTime = HelperDateTime(DateTime(2023, 03));
      // Expectation
      expect(toStringForTest(helperDateTime), "1 month");
    });

    test("Test display day", () {
      // Create an instance
      HelperDateTime helperDateTime = HelperDateTime(DateTime(2023, 04, 01));
      // Expectation
      expect(toStringForTest(helperDateTime), "5 days");
      // Create an instance
      helperDateTime = HelperDateTime(DateTime(2023, 04, 05));
      // Expectation
      expect(toStringForTest(helperDateTime), "1 day");
    });

    test("Test display hour", () {
      // Create an instance
      HelperDateTime helperDateTime = HelperDateTime(DateTime(2023, 04, 06, 10));
      // Expectation
      expect(toStringForTest(helperDateTime), "4 hours");
      // Create an instance
      helperDateTime = HelperDateTime(DateTime(2023, 04, 06, 13));
      // Expectation
      expect(toStringForTest(helperDateTime), "1 hour");
    });

    test("Test display minute", () {
      // Create an instance
      HelperDateTime helperDateTime = HelperDateTime(DateTime(2023, 04, 06, 14, 10));
      // Expectation
      expect(toStringForTest(helperDateTime), "10 minutes");
      // Create an instance
      helperDateTime = HelperDateTime(DateTime(2023, 04, 06, 14, 19));
      // Expectation
      expect(toStringForTest(helperDateTime), "1 minute");
    });

    test("Test display now", () {
      // Create an instance
      HelperDateTime helperDateTime = HelperDateTime(DateTime(2023, 04, 06, 14, 20, 20));
      // Expectation
      expect(toStringForTest(helperDateTime), "now");
      // Create an instance
      helperDateTime = HelperDateTime(DateTime(2023, 04, 06, 14, 20));
      // Expectation
      expect(toStringForTest(helperDateTime), "now");
      // Create an instance
      helperDateTime = HelperDateTime(DateTime(2023, 04, 06, 14, 20, 25));
      // Expectation
      expect(toStringForTest(helperDateTime), "now");
    });
  });


  
}