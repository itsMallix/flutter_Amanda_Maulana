import 'package:flutter/material.dart';
import '17_Assets/assetsPage.dart';
import '17_Assets/contactPage.dart';
import '17_Assets/galleryPage.dart';
import 'package:provider/provider.dart';
import '17_Assets/models/contact.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final contactProvider = Provider.of<ContactData>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: "CeraRoundPro"),
      routes: {
        '/Contact': (context) => const Contact(),
        '/Gallery': (context) => const Gallery(),
      },
      home: const Assets(),
    );
  }
}
