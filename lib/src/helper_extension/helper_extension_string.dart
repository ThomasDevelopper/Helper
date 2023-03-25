library helper;

extension HelperExtensionString on String {

  /// Remove the last character if it's a space.
  ///
  /// ```dart
  /// 'Test the function '.removeLastCharIfSpace(); // 'Test the function'
  /// ```
  String removeLastCharIfSpace() {
    // Split each characters in the list
    List<String> list = split('');
    // If the last character is a space, remove it
    if(list.elementAt(list.length-1) == " ") list.removeAt(list.length-1);
    // Return the string modified
    return list.join();
  }

  /// Remove all empty spaces not needed.
  ///
  /// ```dart
  /// '   This is    a test of the function    '.removeUnnecessarySpaces(); // 'This is a test of the function'
  /// ```
  String removeUnnecessarySpaces() {
    // Initialize a String
    String finalString = "";
    // Initialize the boolean firstLetterIsFound to false
    bool firstLetterIsFound = false;
    // Split each characters in the list
    List<String> list = split('');
    // For each character of the string
    for(int i=0; i<length; i++){
      // If the character is not a space
      // And the first letter was not found yet
      if(list[i]!=" " && !firstLetterIsFound) {
        // Set the boolean firstLetterIsFound to true
        firstLetterIsFound = true;
        // Concat the char to the finalString
        finalString += list[i];
      }
      // If the first letter was already found
      else if(firstLetterIsFound){
        // If the character is a space
        if(list[i] == " "){
          // Concat the space to the finalString
          finalString += list[i];
          // Set firstLetterIsFound to false for prevent the concat of multiple spaces
          firstLetterIsFound = false;
        }
        // If the character is not a space
        else{
          // Concat the char to the finalString
          finalString += list[i];
        }
      }
    }
    // Return the final string
    return finalString.removeLastCharIfSpace();
  }

  /// Set the first character to upper case.
  ///
  /// ```dart
  /// 'test of the function'.firstLetterUpperCase(); // 'Test of the function'
  /// ```
  String firstLetterUpperCase() => "${this[0].toUpperCase()}${substring(1)}";


  /// Separate each upper case by a space + lower case.
  ///
  /// ```dart
  /// 'testOfTheFunction'.separateEachUpperCase(); // 'test of the function'
  /// ```
  String separateEachUpperCase() {
    // Initialize a list
    List<String> finalWord = [];
    // For each character of the sentence
    for(var char in split('')) {
      // If the character is upper case
      if(char.contains(RegExp(r'[A-Z]'))) {
        // Replace the upper case by a space + lower case
        finalWord.add(' ${char.toLowerCase()}');
      }
      // Else if the character is lower case
      else {
        // Simply add the character
        finalWord.add(char);
      }
    }
    return finalWord.join();
  }

  /// Function to remove all spaces in a String.
  ///
  /// ```dart
  /// 'Test of the function'.removeSpaces(); // 'Testofthefunction'
  /// ```
  String removeSpaces() => replaceAll(' ', '');
}