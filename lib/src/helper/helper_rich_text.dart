import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextItem {

  /// Text of the [RichTextItem].
  String text;

  /// TextStyle of the [text].
  TextStyle? style;

  /// Function call when [RichTextItem] is tapped.
  void Function()? onTap;

  /// Constructor of the [RichTextItem].
  RichTextItem({Key? key, required this.text, this.style, this.onTap});
}

class HelperRichText extends StatelessWidget {

  /// List of [RichTextItem].
  final List<RichTextItem> items;

  /// [defaultTextStyle] is set for each [items] if their [TextStyle] is null.
  final TextStyle? defaultTextStyle;

  /// Separator before each [items]
  ///
  /// (exceeded the first one).
  final String separator;

  const HelperRichText({super.key, required this.items, this.defaultTextStyle, this.separator = " "}) : assert(items.length>0);

  /// [GestureRecognizer] called when [item] is tapped.
  GestureRecognizer? _gestureRecognizer(RichTextItem item) {
    // Initialize a GestureRecognizer
    GestureRecognizer? gesture;
    // If the function onTap of the item is not null
    // Set the gesture
    if(item.onTap!=null) gesture = TapGestureRecognizer()..onTap = () => item.onTap!();
    return gesture;
  }

  /// Function to create a [TextSpan] and his children.
  /// The [TextSpan] is the first item of [items], his children are the rest of the list.
  TextSpan _createTextSpan() {
    // Initialize the list of TextSpan
    List<TextSpan> list = [];
    // For each RichTextItem
    for(var item in items) {
      list.add(
          TextSpan(
              text: "$separator${item.text}",
              style: item.style ?? defaultTextStyle,
              recognizer: _gestureRecognizer(item)
          )
      );
    }
    // Remove the first TextSpan
    list.removeAt(0);
    // Return the TextSpan according with the first item in items.
    // The list of children of the TextSpan is the list previously created.
    return TextSpan(
      text: items.first.text,
      style: items.first.style ?? defaultTextStyle,
      recognizer: _gestureRecognizer(items.first),
      children: list
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(text: _createTextSpan());
  }
}
