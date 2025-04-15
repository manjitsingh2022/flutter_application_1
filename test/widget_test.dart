import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/calculator_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Calculator operations and clear functionality', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CalculatorView()),
    );

    // Find widgets
    final input1 = find.byType(TextField).at(0);
    final input2 = find.byType(TextField).at(1);
    final addButton = find.text('+');
    final subtractButton = find.text('-');
    final multiplyButton = find.text('×');
    final divideButton = find.text('÷');
    final clearButton = find.text('Clear'); // ✅ Updated line

    // Enter numbers
    await tester.enterText(input1, '10');
    await tester.enterText(input2, '2');

    // Test addition
    await tester.tap(addButton);
    await tester.pump();
    expect(find.text('Result: 12.0'), findsOneWidget);

    // Test subtraction
    await tester.tap(subtractButton);
    await tester.pump();
    expect(find.text('Result: 8.0'), findsOneWidget);

    // Test multiplication
    await tester.tap(multiplyButton);
    await tester.pump();
    expect(find.text('Result: 20.0'), findsOneWidget);

    // Test division
    await tester.tap(divideButton);
    await tester.pump();
    expect(find.text('Result: 5.0'), findsOneWidget);

    // Test clear button
    await tester.tap(clearButton);
    await tester.pump();

    // After clear, result text should disappear
    expect(find.textContaining('Result:'), findsNothing);

    // TextFields should be empty
    expect((tester.widget(input1) as TextField).controller!.text, '');
    expect((tester.widget(input2) as TextField).controller!.text, '');
  });
}
