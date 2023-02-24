
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_task/ui/widgets/my_app.dart';

void main() {
  testWidgets(
    'BackgroundColorChangeWidget changes background color on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final initialBackgroundColor = _getBackgroundColor(tester);

      await _tapOnGesture(tester);

      final newBackgroundColor = _getBackgroundColor(tester);

      expect(initialBackgroundColor, isNot(equals(newBackgroundColor)));
    },
  );

  testWidgets(
    'Text color is white on dark background',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      await _tapOnGesture(tester);

      final newBackgroundColor = _getBackgroundColor(tester);
      final colorBrightness =
      ThemeData.estimateBrightnessForColor(newBackgroundColor);
      final titleFinder = find.text('Hey there');
      final titleWidget = tester.widget<Text>(titleFinder);
      final titleColor = titleWidget.style?.color;

      if (colorBrightness == Brightness.dark) {
        expect(titleColor, Colors.white);
      } else {
        expect(titleColor, isNot(Colors.white));
      }
    },
  );
}

Color _getBackgroundColor(WidgetTester tester) {
  final coloredBox = tester.widget<ColoredBox>(find.byType(ColoredBox));

  return coloredBox.color;
}

Future<void> _tapOnGesture(WidgetTester tester) async {
  await tester.tap(find.byType(GestureDetector));
  await tester.pump();
}