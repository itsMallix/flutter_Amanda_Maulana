import 'package:flutter/material.dart';

class Assets extends StatefulWidget {
  const Assets({super.key});

  @override
  State<Assets> createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  Color appbar = Color(0xff424242);
  Color background = Color(0xff303030);
  Color primary = Color(0xff4C9CA3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Assets"),
        backgroundColor: appbar,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff424242),
        child: Column(
          children: [
            Container(
              height: 200,
              child: Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/assets_01.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: const Text("Drawer Header"),
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
                      child: Icon(Icons.phone_android_rounded,
                          color: Colors.white),
                    ),
                    title: Text(
                      "Contact",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "|goto_contact");
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: primary,
                      child: Icon(Icons.photo, color: Colors.white),
                    ),
                    title: Text(
                      "Gallery",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "|goto_gallery");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
