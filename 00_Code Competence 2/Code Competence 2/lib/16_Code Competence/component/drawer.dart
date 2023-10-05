import 'dart:async';
import 'package:code_competence/16_Code%20Competence/component/colors.dart';
import 'package:flutter/material.dart';
import 'package:code_competence/16_Code Competence/component/colors.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Expanded(
              flex: 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.15,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/talend_drawebg.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                            height: 30,
                            child:
                                Image.asset("assets/images/talend_putih.png")),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/talend_profile.png")),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Hallo Amanda Maulana",
                            style: TextStyle(
                                color: putih, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("amandamaulana00@gmail.com",
                            style: TextStyle(
                                color: putih, fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.call, color: hitam),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Contact Us",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: hitam,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.info, color: hitam),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: hitam,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.login, color: hitam),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: hitam,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
