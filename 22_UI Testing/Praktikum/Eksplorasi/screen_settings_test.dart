import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miniproject/views/screen_settings/screen_settings.dart';

void main() {
  testWidgets('Test Settings Screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SettingScreen(),
      ),
    );
    expect(find.byType(SettingScreen), findsOneWidget);
  });
  testWidgets(
    'Must Contain IconButton',
    (test) async {
      await test.pumpWidget(
        const MaterialApp(
          home: SettingScreen(),
        ),
      );
      expect(find.byType(IconButton), findsNWidgets(4));
    },
  );
  testWidgets(
    'Must Icons',
    (test) async {
      await test.pumpWidget(
        const MaterialApp(
          home: SettingScreen(),
        ),
      );
      expect(find.byIcon(Icons.navigate_next_rounded), findsNWidgets(4));
    },
  );
  testWidgets(
    'Must Terms & Privacy',
    (test) async {
      await test.pumpWidget(
        const MaterialApp(
          home: SettingScreen(),
        ),
      );
      expect(find.text("Terms & Privacy Policy"), findsOneWidget);
    },
  );
  testWidgets(
    'Must Contain Logout',
    (test) async {
      await test.pumpWidget(
        const MaterialApp(
          home: SettingScreen(),
        ),
      );
      expect(find.text("Log Out"), findsOneWidget);
    },
  );
}
