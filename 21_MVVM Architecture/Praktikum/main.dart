import 'package:flutter/material.dart';
import 'package:flutter_mvvm/viewModels/vm_contact_screen.dart';
import 'package:flutter_mvvm/views/v_contact_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactViewModel(),
      child: MaterialApp(
        title: 'MVVM Contact App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ContactListView(),
      ),
    );
  }
}
