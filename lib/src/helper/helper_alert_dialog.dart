library helper;

import 'package:flutter/material.dart';

/// Class to help the developer to display an AlertDialog.
class HelperAlertDialog {
  
  BuildContext context;

  /// Title of the AlertDialog
  Widget? title;

  /// Content of the AlertDialog.
  Widget content;

  /// List of different widgets in the AlertDialog.
  List<Widget> actions;

  /// Constructor of the class.
  HelperAlertDialog({
    required this.context,
    this.title,
    required this.content,
    required this.actions
  });

  /// Future for show a [AlertDialog].
  ///
  /// - [borderRadius] is the BorderRadius given for the AlertDialog.
  /// - [titleTextStyle] is for customize the TextStyle of the [title].
  /// - [contentTextStyle] is for customize the TextStyle of the [content].
  /// - [barrierDismissible] is to know if the user can close the AlertDialog.
  /// - [barrierColor] is the color in the background
  Future<void> show({
    double borderRadius = 12,
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
    barrierDismissible = true,
    Color barrierColor = Colors.black54
  }) async {
    // Create a AlertDialog
    AlertDialog alertDialog = AlertDialog(
      title: title,
      titleTextStyle: titleTextStyle,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      content: content,
      contentTextStyle: contentTextStyle,
      actions: actions,
    );
    // Show the dialog
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        builder: (context) {
          return alertDialog;
        }
    );
  }

  /// Function to close properly the AlertDialog.
  static closeAlertDialog(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();
}