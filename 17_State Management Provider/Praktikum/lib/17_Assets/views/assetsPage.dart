import 'package:flutter/material.dart';
import 'package:coba_bloc/17_Assets/component/colors.dart';

class Assets extends StatefulWidget {
  const Assets({super.key});

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Assets"),
        backgroundColor: appbar,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xff424242),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Expanded(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: const DrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/assets_01.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Text("Drawer Header"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: primary,
                      child: const Icon(Icons.phone_android_rounded,
                          color: Colors.white),
                    ),
                    title: const Text(
                      "Contact",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/Contact");
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: primary,
                      child: const Icon(Icons.photo, color: Colors.white),
                    ),
                    title: const Text(
                      "Gallery",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/Gallery");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/type.gif"),
            ),
          ),
          Container(
            child: const Text(
              "Flutter Assets And State Management",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text(
              "Flutter assets are resources such as images, fonts, and other files that are bundled with a Flutter application and can be accessed and used within the app",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
