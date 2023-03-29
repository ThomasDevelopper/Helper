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
  group("Test hasDuplicates", () {
    test("Test if has duplicates", () {
      // Initialize a list of integers
      List<int> list = [4, 9, 25, 14, 14, 14, 15, 25, 25];
      // Expect that the list has duplicates
      expect(list.hasDuplicates(), true);
    });

    test("Test if has not duplicates", () {
      // Initialize a list of integers
      List<int> list = [4, 9, 25, 14];
      // Expect that the list has duplicates
      expect(list.hasDuplicates(), false);
    });
  });

  test("Test pickSingleItemRandomly", () {
    // Initialize a list of integers
    List<int> list = [4, 9, 25, 14];
    // Test 10 times
    for(int i=0; i<10; i++){
      // Pick a single integer randomly
      int nbPicked = list.pickSingleItemRandomly();
      // Verify that the nbPicked was in the list
      expect(list.contains(nbPicked), true);
    }
  });



  group("Test pickListItemsRandomly", () {
    test("Test pickListItemsRandomly with duplicates allow", () {
      // Initialize a list of integers
      List<int> list = [4, 9, 25, 14];
      // Test 10 times
      for(int i=0; i<10; i++) {
        // Pick a list of integers randomly
        List<int> listPicked = list.pickItemsRandomly(lengthOfTheList: 10, allowDuplicates: true).cast<int>();
        // Expect that the list has duplicates
        expect(listPicked.hasDuplicates(), true);
      }
    });

    test("Test pickListItemsRandomly with duplicates dont allow", () {
      // Initialize a list of integers
      List<int> list = [4, 9, 25, 14];
      // Test 10 times
      for(int i=0; i<10; i++){
        // Initialize a list of items already picked
        List<int> itemsAlreadyPicked = [];
        // Pick a list of integers randomly
        List<int> listPicked = list.pickItemsRandomly(lengthOfTheList: 3, allowDuplicates: false).cast<int>();
        // For each integers picked
        for(var nb in listPicked){
          // Verify that the nb was in the list
          expect(itemsAlreadyPicked.contains(nb), false);
          // Add the nb in the list of itemsAlreadyPicked
          itemsAlreadyPicked.add(nb);
        }
      }
    });

    test("Test pickListItemsRandomly with duplicates dont allow, throw exception", () {
      // Initialize a list of integers
      List<int> list = [4, 9, 25, 14];
      // Expect that a error was throw because the lengthOfTheList wanted is 10
      // But the length of the list is 4 and duplicates are not allowed
      expect(() => list.pickItemsRandomly(lengthOfTheList: 10, allowDuplicates: false).cast<int>(), throwsStateError);
    });

    test("Test pickListItemsRandomly with duplicates allow, dont throw exception", () {
      // Initialize a list of integers
      List<int> list = [4, 9, 25, 14];
      // Expect that none error was throw because duplicates are allowed
      expect(() => list.pickItemsRandomly(lengthOfTheList: 10, allowDuplicates: true).cast<int>(), isNot(throwsStateError));
    });
  });



  group("Test substituteSingleItem", () {
    // Create Models
    ModelTest m1 = ModelTest(1);
    ModelTest m4 = ModelTest(4);
    ModelTest m1New = ModelTest(1);
    ModelTest m4New = ModelTest(4);
    // Put models in the list
    List<ModelTest> list = [m1, m4];

    test("Test substitute m1 by m1New", () {
      // Expect
      expect(list.first, m1);
      // Substitute
      list.substituteSingleItem(newElement: m1New, oldElement: m1);
      // Expect
      expect(list.first, m1New);
    });

    test("Test substitute m4 by m4New", () {
      // Expect
      expect(list.last, m4);
      // Substitute
      list.substituteSingleItem(newElement: m4New, oldElement: m4);
      // Expect
      expect(list.last, m4New);
    });
  });


  test("Test substitute m1 by m1New", () {
    // Create Models
    ModelTest m1 = ModelTest(1);
    ModelTest m4 = ModelTest(4);
    ModelTest m1New = ModelTest(1);
    ModelTest m4New = ModelTest(4);
    // Put models in the list
    List<ModelTest> list = [m1, m4];
    // Expect
    expect(list.first, m1);
    expect(list.last, m4);
    // Substitute
    list.substituteItems(
        newList: [m4New, m1New],
        test: (newElement, oldElement) => newElement.idModel == oldElement.idModel
    );
    // Expect
    expect(list.first, m1New);
    expect(list.last, m4New);
  });

  test("Test replaceSingleItemAt function", () {
    // Initialize a list
    List<int> list = [4, 7, 29, 12];
    // Replace item in the list
    list.replaceSingleItemAt(oldIndex: 3, newIndex: 1);
    // Expect
    expect(list[0], 4);
    expect(list[1], 12);
    expect(list[2], 7);
    expect(list[3], 29);
  });
}