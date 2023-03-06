import 'dart:math';
import 'package:flutter/material.dart';

/// Our ChangeNotifier model
class BackgroundColorChangeModel extends ChangeNotifier {
  final int _maxRandomRGB = 256;
  final String _title = 'Hey there';
  Color _backgroundColor = Colors.white;

  final TextStyle _titleStyle = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    );

  /// Get our title from _title
  String get title => _title;

  /// Get our titleStyle from _titleStyle
  TextStyle get titleStyle => _titleStyle;

  /// Get our backgroundColor from _backgroundColor
  Color get backgroundColor => _backgroundColor;

  /// Get our textColor from _backgroundColor
  Color get textColor => _getRandomColor();

  /// Change color
  void changeUnicColor() {
    Color newColor;
    do {
      newColor = _getRandomColor();
    } while (newColor == _backgroundColor);

   _backgroundColor = newColor;
   notifyListeners();
   }

  Color _getRandomColor() {
    final random = Random();

    return Color.fromRGBO(
      random.nextInt(_maxRandomRGB),
      random.nextInt(_maxRandomRGB),
      random.nextInt(_maxRandomRGB),
      random.nextDouble(),
    );

  }
}

