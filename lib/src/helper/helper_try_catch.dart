library helper;

import 'package:flutter/foundation.dart';

class HelperTryCatch {

  /// Display the error if the program is in [kDebugMode].
  ///
  /// - [e] is the error.
  /// - [stackTrace] is the stackTrace of the error.
  static void printError(Object e, StackTrace stackTrace) {
    // If the program is in debug mode
    if(kDebugMode){
      // Print the object of the error
      print(e.toString());
      // Print the stackTrace of the error
      print(stackTrace.toString());
    }
  }

}