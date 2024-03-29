library helper;

import 'package:flutter/material.dart';

/// Abstract class to help the developer to display a list or a grid.
abstract class HelperListGrid<E> {

  /// Context
  BuildContext context;

  /// List of data to show in the list/grid.
  List<E>? _data;

  /// String show when [data] is empty.
  String emptyString;

  /// IconData show when [data] is empty.
  IconData emptyIcon;

  /// String show when [data] is null.
  String errorString;

  /// Margin of the content. (only marginTop / marginBottom)
  EdgeInsets? _contentPadding;

  /// Boolean to know if the user can scroll
  bool canScroll;

  /// Static ScrollPhysics used if [canScroll] is true.
  static ScrollPhysics scrollPhysicsStatic = const ScrollPhysics();

  /// Current ScrollPhysics
  /// this physics is set if [scrollPhysics] is different than [scrollPhysicsStatic]
  /// and if [canScroll] is true.
  ScrollPhysics? scrollPhysics;

  HelperListGrid({
    required this.context,
    required this.emptyString,
    required this.emptyIcon,
    required this.errorString,
    this.canScroll = true,
    this.scrollPhysics
  });

  /// Function to initialize [scrollPhysicsStatic] with [scrollPhysics].
  static void initializeParams({
    required ScrollPhysics scrollPhysics
  }) {
    // Set scrollPhysicsStatic
    scrollPhysicsStatic = scrollPhysics;
  }

  /// Display a list of elements.
  ///
  /// - [contentPadding] is the padding between the content of the list.
  /// - if [horizontal] is true, then the direction of the ListView is set to horizontal.
  @protected
  Widget displayList({
    required List<E>? data,
    EdgeInsets? contentPadding,
    bool horizontal = false
  }) {
    // Return the list
    return _display(
        data: data,
        child: () => _showListView(horizontal),
        contentPadding: contentPadding);
  }

  /// Display a list of reorderable elements.
  ///
  /// - [onReorder] is the function called when the user reorder a item.
  /// - [contentPadding] is the padding between the content of the list.
  /// - if [horizontal] is true, then the direction of the ListView is set to horizontal.
  @protected
  Widget displayReorderableList({
    required List<E>? data,
    required void Function(int oldIndex, int newIndex) onReorder,
    EdgeInsets? contentPadding,
    bool horizontal = false
  }) {
    // Return the list
    return _display(
      data: data,
      child: () => _showReorderableListView(horizontal, onReorder: onReorder),
      contentPadding: contentPadding);
  }

  /// Display a grid of elements.
  @protected
  Widget displayGrid({
    required List<E>? data,
    double itemHeight = 2,
    double itemWidth = 1,
    int crossAxisCount = 2,
    double crossAxisSpacing = 10.0,
    double mainAxisSpacing = 10.0,
    EdgeInsets? contentPadding,
  }) {
    // Return the grid
    return _display(
        data: data,
        child: () => _showGridView(
          itemHeight: itemHeight,
          itemWidth: itemWidth,
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing
        ),
        contentPadding: contentPadding
    );
  }


  Widget _display({required List<E>? data, required Widget Function() child, EdgeInsets? contentPadding}) {
    // Set data
    this._data = data;
    // Set contentPadding
    this._contentPadding = contentPadding;
    // Initialize the widget to display
    Widget widgetToDisplay;
    // If the list of data is not null
    if(data!=null){
      // If the list is not empty
      if(data.isNotEmpty){
        widgetToDisplay = child();
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
      physics: canScroll? scrollPhysics ?? scrollPhysicsStatic : const NeverScrollableScrollPhysics(),
      itemCount: _data!.length,
      scrollDirection: horizontal? Axis.horizontal : Axis.vertical,
      itemBuilder: (context, index){
        return widgetToDisplay(index);
      }
    );
    return _contentPadding==null? listView : _displayWithContentPadding(listView);
  }

  /// Display a ReorderableListView.
  ///
  /// If [horizontal] is true, then the list will have a horizontal display.
  Widget _showReorderableListView(bool horizontal, {
    required void Function(int oldIndex, int newIndex) onReorder
  }) {
    ReorderableListView reorderableListView = ReorderableListView.builder(
      shrinkWrap: true,
      physics: canScroll? scrollPhysics ?? scrollPhysicsStatic : const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => widgetToDisplay(index),
      itemCount: _data!.length,
      onReorder: onReorder
    );
    return _contentPadding==null? reorderableListView : _displayWithContentPadding(reorderableListView);
  }

  /// Display a GridView.
  Widget _showGridView({
    required double itemHeight,
    required double itemWidth,
    required int crossAxisCount,
    required double crossAxisSpacing,
    required double mainAxisSpacing
  }) {
    // Create GridView
    GridView gridView = GridView.builder(
      shrinkWrap: true,
      physics: canScroll? scrollPhysics ?? scrollPhysicsStatic : const NeverScrollableScrollPhysics(),
      itemCount: _data!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: (itemWidth/itemHeight)
      ),
      itemBuilder: (context, index) => widgetToDisplay(index)
    );
    return _contentPadding==null? gridView : _displayWithContentPadding(gridView);
  }

  /// Widget called in [_showGridView] or [_showListView] where [_contentPadding] is not null.
  Widget _displayWithContentPadding(Widget widget) => ListView(
    physics: canScroll? scrollPhysics ?? scrollPhysicsStatic : const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: [
      SizedBox(height: _contentPadding!.top),
      widget,
      SizedBox(height: _contentPadding!.bottom)
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.warning, size: 50, color: Colors.grey),
        const SizedBox(height: 10),
        Text(errorString, style: const TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center)
      ],
    ),
  );

  @protected
  Widget widgetToDisplay(int index);

  List<E>? get data => _data;
}