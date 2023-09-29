import 'package:flutter/material.dart';

const primary = 0xff6200EE;
const secondary = 0xff03DAC5;

List<Map> course = [
  {
    "title": "Learn ReactJS",
    "image": "assets/images/react.png",
    "subtitle": "Complete Frontend Development With ReactJS",
    "describe": "Learn react complete frontend development with react",
    "isFavorite": false
  },
  {
    "title": "Learn Flutter",
    "image": "assets/images/flutter.png",
    "subtitle": "Complete Mobile Development With Flutter",
    "describe": "Learn flutter complete mobile development with flutter",
    "isFavorite": false
  },
  {
    "title": "Learn VueJS",
    "image": "assets/images/vue.png",
    "subtitle": "Complete Frontend Development With VueJS",
    "describe": "Learn vuejs complete frontend development with vue",
    "isFavorite": false
  },
  {
    "title": "Learn Tailwind CSS",
    "image": "assets/images/tailwind.png",
    "subtitle": "Complete web Development With Tailwind CSS",
    "describe": "Learn tailwind complete web development with tailwind",
    "isFavorite": false
  },
  {
    "title": "Learn UI/UX",
    "image": "assets/images/uiux.png",
    "subtitle": "Learn advanced UI/UX Design Thinking",
    "describe": "Mastering design thinking advancend UI/UX design",
    "isFavorite": false
  },
  {
    "title": "Learn Figma",
    "image": "assets/images/figma.png",
    "subtitle": "Complete UI/UX Designer With Figma",
    "describe": "Learn figma complete UI/UX designer with figma",
    "isFavorite": false
  },
  {
    "title": "Learn Digital Marketing",
    "image": "assets/images/marketing.png",
    "subtitle": "Complete Digital Marketing With Google Ads",
    "describe": "Learn digital marketing enterpreneurship with google ads",
    "isFavorite": false
  },
];

void main() {
  runApp(Eksplorasi());
}

class Eksplorasi extends StatelessWidget {
  const Eksplorasi({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EksplorasiHomePage(),
    );
  }
}

class EksplorasiHomePage extends StatefulWidget {
  const EksplorasiHomePage({Key? key});

  @override
  State<EksplorasiHomePage> createState() => _EksplorasiHomePageState();
}

class _EksplorasiHomePageState extends State<EksplorasiHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        centerTitle: true,
        backgroundColor: Color(primary),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: course.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      course[index]['title'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      course[index]['subtitle'],
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: IconButton(
                      icon: course[index]['isFavorite']
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        setState(
                          () {
                            course[index]['isFavorite'] =
                                !course[index]['isFavorite'];
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 110.0,
                    width: 400.0,
                    child: Image.asset(
                      course[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(course[index]['describe']),
                  ),
                  ButtonBar(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 172, 155),
                        ),
                        onPressed: () {},
                        child: Text("Start Course"),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info_rounded),
                label: "Information",
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Color(primary),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromARGB(255, 203, 166, 255),
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16.0, // Sesuaikan dengan posisi vertikal yang diinginkan
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add, color: Color(0xff6200EE)),
                backgroundColor: Color(secondary),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
