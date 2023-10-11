import 'package:coba_storage/view/v_contactItemScreen.dart';
import 'package:coba_storage/view/v_contactListScreen.dart';
import 'package:coba_storage/view/v_emptyScreen.dart';
import 'package:coba_storage/view/v_loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coba_storage/model/m_db_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late SharedPreferences loginData;
  String username = "";

  @override
  void initState() {
    super.initState();
    initializing();
  }

  void initializing() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString("username") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halo ${username}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          TextButton(
            onPressed: () {
              loginData.setBool("login", true);
              loginData.remove("username");
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (route) => false);
            }, //nampilin pofile
            child: const Text(
              "logout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<DbManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactItem(),
            ),
          );
        },
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<DbManager>(
      builder: (context, value, child) {
        if (value.contactModels.isNotEmpty) {
          return ContactList(manager: value);
        } else {
          return const EmptyScreen();
        }
      },
    );
  }
}
