
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
    'Text color is change on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final initialTextColor = _getTextColor(tester);

      await _tapOnGesture(tester);

      final newTextColor = _getTextColor(tester);

      expect(newTextColor, isNot(initialTextColor));
    },
  );
}



Color _getBackgroundColor(WidgetTester tester) {
  final coloredBox = tester.widget<ColoredBox>(find.byType(ColoredBox));

  return coloredBox.color;
}

Color? _getTextColor(WidgetTester tester) {
  final text = tester.widget<Text>(find.byType(Text));

  return text.style?.color;
}

Future<void> _tapOnGesture(WidgetTester tester) async {
  await tester.tap(find.byType(GestureDetector));
  await tester.pump();
}