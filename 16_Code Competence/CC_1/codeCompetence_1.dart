import 'package:coba_flutter/17_Assets/gallery_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CodeCompentence1 extends StatefulWidget {
  const CodeCompentence1({super.key});

  @override
  State<CodeCompentence1> createState() => _CodeCompentence1State();
}

class _CodeCompentence1State extends State<CodeCompentence1> {
  final List<int> numbers = [1, 2, 3];
  Color biru = Color(0xff3700B3);
  Color hitam = Color(0xff2b2b2b);
  Color putih = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            elevation: 0.0,
            title: Container(
              padding: EdgeInsets.only(left: 10),
              width: 120,
              child: Image.asset("assets/images/logo.png"),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.black,
                ),
              ),
            ],
            bottom: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Container(
                height: 30,
                width: double.infinity,
                color: Colors.white,
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Apa Yang Ingin Anda Cari ?",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/talend_hero.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.white],
                            stops: [0, .8],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              Text(
                                "Bersama Talend",
                                style: TextStyle(
                                  color: biru,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Dapatkan Penghasilan Sampai Puluhan Jut Rupiah",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: hitam,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 1000,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kampanye Baru",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: numbers.length,
                          itemBuilder: (context, index) => Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Card(
                              color: biru,
                              child: Container(
                                child: Text(
                                  numbers[index].toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Image.asset("assets/images/talend_hero2.png"),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                right: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mari bergabung dengan",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: putih),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Komunitas Creative Freelance Talend",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 34,
                                          color: putih),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Kampanye Baru",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: numbers.length,
                          itemBuilder: (context, index) => Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Card(
                              color: biru,
                              child: Container(
                                child: Text(
                                  numbers[index].toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
