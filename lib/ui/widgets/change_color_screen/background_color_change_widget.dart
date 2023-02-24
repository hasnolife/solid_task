import 'dart:math';

import 'package:flutter/material.dart';

/// StateFull Widget that changes background color on tap
class BackgroundColorChangeWidget extends StatefulWidget {
  /// Constructor
  const BackgroundColorChangeWidget({Key? key}) : super(key: key);

  @override
  _BackgroundColorChangeWidgetState createState() =>
      _BackgroundColorChangeWidgetState();
}

class _BackgroundColorChangeWidgetState
    extends State<BackgroundColorChangeWidget> {
  final double _opacity = 1;
  final int _maxRandomRGB = 256;
  final String _title = 'Hey there';
  final TextStyle _titleStyle = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  Color _backgroundColor = Colors.white;

  Color _getRandomColor() {
    final random = Random();

    return Color.fromRGBO(
      random.nextInt(_maxRandomRGB),
      random.nextInt(_maxRandomRGB),
      random.nextInt(_maxRandomRGB),
      _opacity,
    );
  }

  Color _getUniqueRandomColor() {
    Color newColor;
    do {
      newColor = _getRandomColor();
    } while (newColor == _backgroundColor);

    return newColor;
  }

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = _getUniqueRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _backgroundColor.computeLuminance() < 0.5;

    return Scaffold(
      body: GestureDetector(
        onTap: _changeBackgroundColor,
        child: ColoredBox(
          color: _backgroundColor,
          child: Center(
            child: Text(
              _title,
              style: _titleStyle.copyWith(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
