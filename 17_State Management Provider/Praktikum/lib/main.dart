import 'package:coba_bloc/17_Assets/controllers/c_contact.dart';
import 'package:coba_bloc/17_Assets/controllers/c_gallery.dart';
import 'package:coba_bloc/17_Assets/controllers/c_selectedGallery.dart';
import 'package:flutter/material.dart';
import '17_Assets/views/assetsPage.dart';
import '17_Assets/views/contactPage.dart';
import '17_Assets/views/galleryPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactController()),
        ChangeNotifierProvider(create: (_) => GalleryController()),
        ChangeNotifierProvider(create: (_) => SelectedImageProvider()),
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
