library helper;

import 'package:flutter/material.dart';

/// Class to help the developer to display modal bottom sheets.
class HelperModalBottomSheet {

  BuildContext context;

  /// If this boolean is set to true,
  /// it will display a little divider at the top.
  static bool _withDivider = true;

  /// Boolean to know if the modal bottom sheet is dismissible.
  static bool _isDismissible = true;

  /// Boolean to know if the modal bottom sheet is draggable.
  static bool _enableDrag = true;

  /// Background of the modal bottom sheet.
  static Color? _backgroundColor;

  /// BorderRadius of the modal bottom sheet.
  static BorderRadius _borderRadius = const BorderRadius.vertical(top: Radius.circular(20));

  HelperModalBottomSheet(this.context);

  /// Function to override all static params.
  ///
  /// Call this function at the launch of the program.
  static void overrideParams({
    bool? withDivider,
    bool? isDismissible,
    bool? enableDrag,
    Color? backgroundColor,
    BorderRadius? borderRadius
  }) {
    if(withDivider!=null) _withDivider = withDivider;
    if(isDismissible!=null) _isDismissible = isDismissible;
    if(enableDrag!=null) _enableDrag = enableDrag;
    if(backgroundColor!=null) _backgroundColor = backgroundColor;
    if(borderRadius!=null) _borderRadius = borderRadius;
  }

  /// Show the modal bottom sheet.
  ///
  /// - [child] is the content of the modal bottom sheet.
  Future<void> showMbs({
    required Widget child,
    bool? withDivider,
    bool? isDismissible,
    bool? enableDrag,
    Color? backgroundColor,
    BorderRadius? borderRadius
  }) async => await showModalBottomSheet(
      context: context,
      isDismissible: isDismissible ?? _isDismissible,
      enableDrag: enableDrag ?? _enableDrag,
      backgroundColor: backgroundColor ?? _backgroundColor,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? _borderRadius
      ),
      builder: (context) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if(withDivider ?? _withDivider) const SizedBox(height: 5),
            if(withDivider ?? _withDivider) _displayDivider(),
            child
          ],
        ),
      )
  );

  /// Display the divider at the top of the modal bottom sheet.
  Widget _displayDivider() => Center(
    child: Container(
      width: MediaQuery.of(context).size.width/3,
      height: 4,
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)
      ),
    )
  );
}