import 'package:code_competence/16_Code%20Competence/view/codeCompetence_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Screen harus ada teks bersama talend",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CodeCompentence1(),
      ),
    );
    expect(find.text("Bersama Talend"), findsOneWidget);
  });

  testWidgets("Screen harus ada teks deskripsi", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CodeCompentence1(),
      ),
    );
    expect(find.text("Dapatkan Penghasilan Sampai Puluhan Juta Rupiah"),
        findsOneWidget);
  });

  testWidgets("screen harus ada text about us", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CodeCompentence1(),
      ),
    );
    expect(find.text("About Us"), findsOneWidget);
  });

  testWidgets("Tes container memiliki child column",
      (WidgetTester tester) async {
    const containerWidget = Column(
      children: [],
    );
    await tester.pumpWidget(
      Container(
        child: containerWidget,
      ),
    );
    expect(find.byWidget(containerWidget), findsOneWidget);
  });
}
