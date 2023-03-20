library helper;

import 'package:flutter/material.dart';

/// Abstract class to help the developer to display a list or a grid.
abstract class HelperListGrid {

  /// Context
  BuildContext context;
  /// List of data to show in the list/grid.
  List<dynamic>? data;
  /// String show when [data] is empty.
  String emptyString;
  /// IconData show when [data] is empty.
  IconData emptyIcon;
  /// String show when [data] is null.
  String errorString;
  /// Margin of the content. (only marginTop / marginBottom)
  EdgeInsets? contentPadding;

  HelperListGrid({
    required this.context,
    required this.data,
    required this.emptyString,
    required this.emptyIcon,
    required this.errorString
  });

  /// Display a list of elements.
  ///
  /// - [contentPadding] is the padding between the content of the list.
  /// - if [horizontal] is true, then the direction of the ListView is set to horizontal.
  Widget displayList({
    EdgeInsets? contentPadding,
    bool horizontal = false
  }) => _display(child: _showListView(horizontal), contentPadding: contentPadding);

  /// Display a grid of elements.
  Widget displayGrid({
    double itemHeight = 2,
    double itemWidth = 1
  }) => _display(
      child: _showGridView(itemHeight: itemHeight, itemWidth: itemWidth)
  );


  Widget _display({required Widget child, EdgeInsets? contentPadding}) {
    // Initialize the content margin
    this.contentPadding = contentPadding;
    // Initialize the widget to display
    Widget widgetToDisplay;
    // If the list of data is not null
    if(data!=null){
      // If the list is not empty
      if(data!.isNotEmpty){
        widgetToDisplay = child;
      }
      // If the list is empty
      else{
        widgetToDisplay = _emptyWidget();
      }
    }
    // If the list is null
    else{
      widgetToDisplay = _errorWidget();
    }
    return widgetToDisplay;
  }

  /// Display a ListView.
  ///
  /// If [horizontal] is true, then the list will have a horizontal display.
  Widget _showListView(bool horizontal) {
    ListView listView = ListView.builder(
      shrinkWrap: true,
      itemCount: data!.length,
      scrollDirection: horizontal? Axis.horizontal : Axis.vertical,
      itemBuilder: (context, index){
        return widgetToDisplay(index);
      }
    );
    return contentPadding==null? listView : _contentPadding(listView);
  }

  /// Display a GridView.
  Widget _showGridView({
    required double itemHeight,
    required double itemWidth
  }) {
    // Create GridView
    GridView gridView = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: (itemWidth/itemHeight)
      ),
      itemBuilder: (context, index) => widgetToDisplay(index)
    );
    return contentPadding==null? gridView : _contentPadding(gridView);
  }

  /// Widget called in [_showGridView] or [_showListView] where [contentPadding] is not null.
  Widget _contentPadding(Widget widget) => ListView(
    shrinkWrap: true,
    children: [
      SizedBox(height: contentPadding!.top),
      widget,
      SizedBox(height: contentPadding!.bottom)
    ],
  );

  /// Widget called when [data] is empty.
  Widget _emptyWidget() => Center(
    key: const Key("empty_widget"),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(emptyIcon, size: 50, color: Colors.grey),
        const SizedBox(height: 10),
        Text(emptyString, style: const TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center)
      ],
    ),
  );

  /// Widget called when [data] is null.
  Widget _errorWidget() => Center(
    key: const Key("error_widget"),
    child: Column(
      children: [
        const Icon(Icons.warning),
        Text(errorString)
      ],
    ),
  );

  Widget widgetToDisplay(int index);
}