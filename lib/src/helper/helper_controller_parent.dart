library helper;

import 'dart:io';

import 'package:flutter/cupertino.dart';

/// Abstract class to help the developer to develop the controllers associated with the views.
abstract class HelperControllerParent
{
  /// Check if the code is run from test.
  final bool _inTesting = Platform.environment.containsKey('FLUTTER_TEST');

  /// Check if the code is run from test (static way).
  static final bool _inTestingStatic = Platform.environment.containsKey('FLUTTER_TEST');


  /// Function to create a future that will return [intReturn].
  ///
  /// (Use for test)
  Future<int> createFutureIntForTest({int intReturn = 1}) async {
    // If not in testing, throw an exception
    if(!_inTesting) throw Exception("Only in test mode");
    // Return intReturn
    return intReturn;
  }

  /// Function to create a future that will return "NOK" if [returnNOK] is true,
  /// otherwise it will return "OK".
  ///
  /// (Use for test)
  Future<String> createFutureStringForTest({bool returnNOK = false}) async {
    // If not in testing, throw an exception
    if(!_inTesting) throw Exception("Only in test mode");
    // Return "OK" or "NOK"
    return returnNOK? "NOK" : "OK";
  }

  static bool get inTestingStatic => _inTestingStatic;

  bool get inTesting => _inTesting;
}