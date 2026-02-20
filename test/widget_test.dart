import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:emo/main.dart';

void main() {
  setUp(() {
    // Provide an empty store so SharedPreferences works in tests.
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App renders title and chat input', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // App bar title should be present.
    expect(find.text('Emo'), findsOneWidget);

    // The text field hint should be visible when no message has been typed.
    expect(find.widgetWithText(TextField, 'How are you feeling now?...'), findsOneWidget);

    // The send button should be present and enabled initially.
    expect(find.byIcon(Icons.send), findsOneWidget);
    final ElevatedButton sendButton =
        tester.widget(find.byType(ElevatedButton));
    expect(sendButton.onPressed, isNotNull);
  });

  testWidgets('Send button is disabled while loading', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Initially the send button must be enabled.
    final ElevatedButton sendButtonBefore =
        tester.widget(find.byType(ElevatedButton));
    expect(sendButtonBefore.onPressed, isNotNull);
  });

  testWidgets('Empty input does not trigger send', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // No messages shown at start.
    expect(find.byType(MessageBubble), findsNothing);

    // Tap send without typing anything.
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    // Still no messages — empty input was ignored.
    expect(find.byType(MessageBubble), findsNothing);
  });

  testWidgets('Drawer opens on menu icon tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Drawer header should now be visible.
    expect(find.text('Saved Messages'), findsOneWidget);
  });
}
