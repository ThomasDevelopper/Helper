import 'package:flutter_test/flutter_test.dart';
import 'package:helper/helper.dart';

/// Class for test function
class ModelTest{
  /// Id of the model
  int idModel;
  /// Constructor of the class
  ModelTest(this.idModel);
}

void main()
{
  group("Test firstWhereOrNull function", () {
    // Create Models
    ModelTest m1 = ModelTest(1);
    ModelTest m1Double = ModelTest(1);
    ModelTest m3 = ModelTest(3);
    ModelTest m5 = ModelTest(5);
    // Put models in the list
    List<ModelTest> list = [m1, m3, m1Double, m5];

    test("Fetch the first item in the list when the function return true", () {
      // Expectations
      expect(list.firstWhereOrNull((element) => element.idModel==1), m1);
      expect(list.firstWhereOrNull((element) => element.idModel==5), m5);
      expect(list.firstWhereOrNull((element) => element.idModel==3), m3);
    });

    test("None item was found", () {
      // Expectations
      expect(list.firstWhereOrNull((element) => element.idModel==0), null);
      expect(list.firstWhereOrNull((element) => element.idModel==6), null);
      expect(list.firstWhereOrNull((element) => element.idModel==2), null);
    });
  });



  group("Test singleWhereOrNull function", () {
    // Create Models
    ModelTest m1 = ModelTest(1);
    ModelTest m1Double = ModelTest(1);
    ModelTest m3 = ModelTest(3);
    ModelTest m5 = ModelTest(5);
    // Put models in the list
    List<ModelTest> list = [m1, m3, m1Double, m5];

    test("Test fetch single item when the function return true", () {
      // Expectations
      expect(list.singleWhereOrNull((element) => element.idModel==5), m5);
      expect(list.singleWhereOrNull((element) => element.idModel==3), m3);
    });

    test("Test function return true multiple times", () {
      // Expectation
      expect(() => list.singleWhereOrNull((element) => element.idModel==1), throwsStateError);
    });
  });
}