import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:helper/helper.dart';

void main()
{
  group("Test encode function", () {
    test("Encode Map<String, String>", () {
      // Create a map
      Map<String, String> map = {
        'idUser': '1',
        'pseudoUser': 'Toto'
      };
      // Expectation
      expect(map.encode(), json.encode(map));
    });

    test("Encode Map<String, dynamic>", () {
      // Create a map
      Map<String, dynamic> map = {
        'idUser': 1,
        'reviewUser': 4.85,
        'pseudoUser': 'Toto'
      };
      // Convert the map in String
      Map<String, String> mapInString = map.castAllValuesInString();
      // Expectation
      expect(map.encode(), json.encode(mapInString));
    });
  });


}