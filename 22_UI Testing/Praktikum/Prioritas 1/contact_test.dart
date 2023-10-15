import 'package:coba_flutter/15_advanced%20form/advancedForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "Appbar harus memiliki teks Contact",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      expect(find.text("Contact"), findsOneWidget);
    },
  );
  testWidgets(
    "Button harus memiliki teks Submit",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      expect(find.text("Submit"), findsOneWidget);
    },
  );
  testWidgets(
    "Title harus teks berbunyi Create New Contact",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      expect(find.text("Create New Contact"), findsOneWidget);
    },
  );
  testWidgets(
    "Form field harus memiliki teks Name",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      expect(find.text("Name"), findsOneWidget);
    },
  );
  testWidgets(
    "Form harus memiliki teks nomor",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      expect(find.text("Nomor"), findsOneWidget);
    },
  );
  testWidgets(
    "Screen harus memiliki icon phone",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      expect(find.byIcon(Icons.phonelink), findsOneWidget);
    },
  );
  testWidgets(
    "Header secttion harus memiliki teks List Contact",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      expect(find.text("List Contact"), findsOneWidget);
    },
  );

  testWidgets(
    "Button harus memiliki floating action button",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContactScreen(),
        ),
      );
      expect(find.byType(FloatingActionButton), findsOneWidget);
    },
  );
}
