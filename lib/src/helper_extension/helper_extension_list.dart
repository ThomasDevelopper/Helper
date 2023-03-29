library helper;

import 'dart:math';

extension HelperExtensionList<E> on List<E> {

  /// Pick a single item randomly in the list.
  E pickSingleItemRandomly() {
    // If the list is empty
    // Throw an exception
    if(isEmpty) throw StateError("The list must be not empty");
    // Generate a random index
    int indexRandom = Random().nextInt(length-1);
    // Return the element of the list at the index previously selected
    return elementAt(indexRandom);
  }

  /// Pick items randomly in the list.
  ///
  /// - [lengthOfTheList] is the desired size of the list of items.
  List<E> pickItemsRandomly({
    required int lengthOfTheList,
    bool allowDuplicates = false
  }) {
    if(lengthOfTheList>length && !allowDuplicates) throw StateError("The length of the list must be equal or superior than lengthOfTheList parameter");
    // Create a copy of the original list
    List<dynamic> listCopy = List.from(this);
    // Initialize a list of items picked
    List<E> itemsPicked = [];
    // While the length of itemsPicked is less than the parameter
    while(itemsPicked.length<lengthOfTheList){
      // Generate a random index
      int indexRandom = Random().nextInt(listCopy.length-1);
      // Add the element of the copy list at the random index
      // Into items picked
      itemsPicked.add(listCopy.elementAt(indexRandom));
      // If the user don't allow duplicate then
      // Remove the item from the copy list
      if(!allowDuplicates) listCopy.removeAt(indexRandom);
    }
    // Return all items picked randomly
    return itemsPicked;
  }

  /// Checks if the list has duplicate(s).
  bool hasDuplicates() {
    // Initialize gotDuplicates to false
    bool gotDuplicatesBool = false;
    // Initialize a list of items already checked
    List<dynamic> itemsAlreadyChecked = [];
    // For each item of the list
    for(var item in this) {
      // If the bool is still false
      if(!gotDuplicatesBool) {
        // If the list of itemsAlreadyCheck contains the item
        if(itemsAlreadyChecked.contains(item)){
          // Then set gotDuplicatesBool to true
          gotDuplicatesBool = true;
        }
        // If the list of itemsAlreadyCheck do not contains the item
        else{
          // Then add the item in the list of itemsAlreadyChecked
          itemsAlreadyChecked.add(item);
        }
      }
    }
    return gotDuplicatesBool;
  }

  /// Function to substitute [oldElement] by [newElement] in the list.
  void substituteSingleItem({
    required E newElement,
    required E oldElement
  }) {
    // Get the index of the oldElement in the list
    int index = indexOf(oldElement);
    // Remove the element at the index
    removeAt(index);
    // Insert the new element in the list
    insert(index, newElement);
  }

  /// Function to substitute a element of the list
  /// by the element of [newList] when [test] return true.
  void substituteItems({
    required List<E> newList,
    required bool Function(E newElement, E oldElement) test
  }) {
    // For each item in the newList
    for(var newItem in newList) {
      // For each item in this list
      for (var oldItem in this) {
        // If the function test return true
        // Substitute the oldItem by the newItem
        if(test(newItem, oldItem)) substituteSingleItem(newElement: newItem, oldElement: oldItem);
      }
    }
  }

  /// Function to remove the element at [oldIndex]
  /// and put it at [newIndex].
  void replaceSingleItemAt({
    required int oldIndex,
    required int newIndex
  }) {
    // Get the element at old index
    E element = elementAt(oldIndex);
    // Remove the item at the index
    removeAt(oldIndex);
    // Add the element at the new index
    insert(newIndex, element);
  }
}