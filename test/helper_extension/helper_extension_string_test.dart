import 'package:flutter_test/flutter_test.dart';
import 'package:helper/src/helper_extension/helper_extension_string.dart';

void main()
{
  test("Test the function to remove all spaces empty", () {
    // All expectations
    expect(" Test      the functionality of the function       ".removeEmptySpaces(), "Test the functionality of the function");
    expect("Test the functionality      of the function".removeEmptySpaces(), "Test the functionality of the function");
    expect("Final test".removeEmptySpaces(), "Final test");
  });

  test("Test the function removeLastCharIfSpace", () {
    // All expectations
    expect("Test the functionality of the function ".removeLastCharIfSpace(), "Test the functionality of the function");
    expect("Second test ".removeLastCharIfSpace(), "Second test");
    expect("Third test".removeLastCharIfSpace(), "Third test");
  });

  test("Test the function firstLetterUpperCase", () {
    // All expectations
    expect("first test".firstLetterUpperCase(), "First test");
    expect("Second test".firstLetterUpperCase(), "Second test");
    expect("third Test".firstLetterUpperCase(), "Third Test");
  });

  test("Test the function separateEachUpperCase", () {
    // All expectations
    expect("firstTest".separateEachUpperCase(), "first test");
    expect("secondTestOfTheFunction".separateEachUpperCase(), "second test of the function");
  });

  test("Test the function removeSpaces", () {
    // All expectations
    expect("First test".removeSpaces(), "Firsttest");
    expect("second test of the function".removeSpaces(), "secondtestofthefunction");
  });
}