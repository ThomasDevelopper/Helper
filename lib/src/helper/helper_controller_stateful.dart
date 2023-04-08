import 'package:flutter/material.dart';
import 'package:helper/helper.dart';

class HelperControllerStateful<T extends State> extends HelperControllerParent{

  /// State associated with the controller.
  final T _state;

  /// Constructor to initialize [state].
  HelperControllerStateful(this._state);

  /// Current [_state].
  @protected
  T get state => _state;
}