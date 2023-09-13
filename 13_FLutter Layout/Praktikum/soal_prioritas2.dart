import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Prioritas2 extends StatelessWidget {
  const Prioritas2({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: CupertinoHomePage(),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({super.key});

  @override
  _CupertinoHomePageState createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Center(
      child: Text('This is CupertinoApp Page 1'),
    ),
    Center(
      child: Text('This is CupertinoApp Page 2'),
    ),
    Center(
      child: Text('This is CupertinoApp Page 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.back),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Cupertino App'),
              ),
              child: _tabs[index],
            );
          },
        );
      },
    );
  }
}
