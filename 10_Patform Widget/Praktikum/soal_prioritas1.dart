import 'package:flutter/material.dart';

List<Map> contact = [
  {
    "profile": "assets/images/1_leane.webp",
    "name": "Leanne Graham",
    "phone": "1-770-736-8031 x56442"
  },
  {
    "profile": "assets/images/2_ervin.webp",
    "name": "Ervin Howell",
    "phone": "010-692-6593 x09125"
  },
  {
    "profile": "assets/images/3_bauch.webp",
    "name": "Clementine Bauch",
    "phone": "1-463-123-4447"
  },
  {
    "profile": "assets/images/4_patricia.webp",
    "name": "Patricia Lebsack",
    "phone": "493-170-9623 x156"
  },
  {
    "profile": "assets/images/5_chelsey.webp",
    "name": "Chelsey Dietrich",
    "phone": "(254)954-1289"
  },
  {
    "profile": "assets/images/6_dennis.webp",
    "name": "Mrs. Dennis Schulist",
    "phone": "1-477-935-8478 x6430"
  },
  {
    "profile": "assets/images/7_kurtis.webp",
    "name": "Kurtis Weissnat",
    "phone": "210.067.6132"
  },
];

class Prioritas1 extends StatelessWidget {
  const Prioritas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      appBar: AppBar(
        title: const Text('MaterialApp'),
        backgroundColor: Color(0xff424242),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff424242),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text('Home'),
              textColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text('Settings'),
              textColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (BuildContext, int index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(contact[index]['profile']),
                ),
                trailing: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                title: Text(
                  contact[index]['name'],
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                subtitle: Text(
                  contact[index]['phone'],
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
            itemCount: contact.length),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        backgroundColor: Color(0xff424242),
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
