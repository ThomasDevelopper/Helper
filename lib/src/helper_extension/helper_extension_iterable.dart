library helper;

extension HelperExtensionIterable<E> on Iterable<E> {

  /// Function to select the first item (if exist) in the list
  /// when [test] function return true.
  E? firstWhereOrNull(bool Function(E element) test) {
    // Initialize a element
    E? element;
    // For each item of the list
    for(var item in this) {
      // If the function return true
      // and if the element is null
      // Set the element
      if(test(item) && element==null) element = item;
    }
    return element;
  }

  /// Function to select the single item (if exist) in the list
  /// when [test] function return true.
  E? singleWhereOrNull(bool Function(E element) test) {
    // Initialize a element
    E? element;
    // For each item of the list
    for(var item in this) {
      // If the test function return true
      // and if the element was not found yet
      if(test(item) && element==null) {
        // Set the element
        element = item;
      }
      // If the test function return true
      // but the element was already found
      else if(test(item) && element!=null) {
        // Throw a StateError
        throw StateError("Too many elements");
      }
    }
    // Return the element if exist
    return element;
  }
}