library helper;

import 'dart:convert';

extension HelperExtensionMap<K, V> on Map<K, V> {

  /// Function to encode a map in String.
  ///
  /// If the type of [V] is dynamic, we call [castAllValuesInString]
  /// before encode the map.
  String encode() {
    // Initialize a mapEncoded
    String mapEncoded;
    // If the type of values is String
    if(V == String) {
      // Encode the map
      mapEncoded = json.encode(this);
    }
    // If the type of values is dynamic
    else{
      // Cast all values in String
      // and encode the map
      mapEncoded = json.encode(castAllValuesInString());
    }
    return mapEncoded;
  }



  /// Function to cast all values automatically in String.
  /// This function can't handle boolean values.
  ///
  /// ```dart
  /// Map<String, dynamic> map = {
  ///   'idUser': 1,
  ///   'reviewUser': 4.85
  ///   'pseudoUser': "Toto"
  /// };
  ///
  /// Map<String, String> newMap = map.castAllValuesInString();
  ///
  /// newMap = {
  ///   'idUser': '1',
  ///   'reviewUser': "4.85"
  ///   'pseudoUser': "Toto"
  /// }
  /// ```
  Map<String, String> castAllValuesInString() {
    // Create a copy of the map
    Map<String, String> mapFinal = {};
    // For each keys/values
    forEach((key, value) {
      // Transform the key as a String
      String keyAsString = key as String;
      // For each type of the value
      switch(value.runtimeType){
        // If the type of the value is int
        case int:
          mapFinal[keyAsString] = (value as int).toString();
          break;
        // If the type of the value is String
        case String:
          mapFinal[keyAsString] = value.toString();
          break;
        // If the type of the value is double
        case double:
          mapFinal[keyAsString] = (value as double).toString();
          break;
      }
    });
    // Return the final map
    return mapFinal;
  }
}