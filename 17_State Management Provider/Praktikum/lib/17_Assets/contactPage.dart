import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:coba_bloc/17_Assets/models/contact.dart';
import 'package:coba_bloc/17_Assets/models/colors.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nomorController = TextEditingController();

  TextEditingController _editNameController = TextEditingController();
  TextEditingController _editNomorController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String? name = "";
  String? nomor = "";

  bool isCapitalized(String s) {
    return s.isNotEmpty && s[0] == s[0].toUpperCase();
  } // validator upercase name

  bool isAlphaNumeric(String s) {
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(s);
  } // validator special char name

  bool isNumeric(String s) {
    return RegExp(r'^[0-9]+$').hasMatch(s);
  } // validator number only digit

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactData>(context);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'Contact',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: appbar,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                Container(
                  child: Icon(
                    Icons.phonelink,
                    color: typograph,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Create New Contact',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: typograph),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Text(
                    "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: typograph),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: typograph,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.person),
                                fillColor: Color(0xffe7e0ec),
                                filled: true,
                                label: Text("Name"),
                                hintText: "Insert Your Name"),
                            validator: (value) {
                              name = value;
                              if (value == null || value.isEmpty) {
                                return 'Name cannot be empty';
                              }

                              List<String> words = value.split(' ');
                              if (words.length != 2) {
                                return 'Name must contain first and last name';
                              }

                              for (String word in words) {
                                if (!isCapitalized(word)) {
                                  return 'Each word should start with a capitalized';
                                }
                              }

                              if (!isAlphaNumeric(value)) {
                                return 'Name must contain only alphabetic characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            controller: _nomorController,
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.phone_android),
                                fillColor: Color(0xffe7e0ec),
                                filled: true,
                                label: Text("Nomor"),
                                hintText: "+62...."),
                            validator: (value) {
                              nomor = value;
                              if (value == null || value.isEmpty) {
                                return 'Number cannot be empty';
                              }

                              if (value[0] != '0') {
                                return 'Number must start with 0';
                              }

                              if (value.length < 8 || value.length > 15) {
                                return 'Number length must be between 8 and 15';
                              }

                              if (!isNumeric(value)) {
                                return 'Number should contain only digits';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10.0),
                          Divider(
                            color: typograph,
                          ),
                          SizedBox(
                            height: 45.0,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primary),
                              child: const Text(
                                "Submit",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Data Berhasil Ditambahkan"),
                                  ));
                                  contactProvider.add({
                                    "name": _nameController.text,
                                    "nomor": _nomorController.text
                                  });
                                  setState(() {
                                    formKey.currentState!.reset();
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: const Text(
                              "List Contact",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: contactProvider.contacts.length,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: ListTile(
                                tileColor: appbar,
                                leading: CircleAvatar(
                                  backgroundColor: primary,
                                  child: Text(
                                    contactProvider.contacts[index]['name']![0],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: typograph),
                                  ),
                                ),
                                title: Text(
                                  contactProvider.contacts[index]['name']!,
                                  style: TextStyle(color: typograph),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      contactProvider.contacts[index]['nomor']!,
                                      style: TextStyle(color: typograph),
                                    ),
                                    Text(
                                      DateFormat('dd/MM/yyyy').format(_dueDate),
                                      style: TextStyle(color: typograph),
                                    ),
                                  ],
                                ),
                                trailing: Container(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (index >= 0 &&
                                              index <
                                                  contactProvider
                                                      .contacts.length) {
                                            _editNameController.text =
                                                contactProvider.contacts[index]
                                                    ['name']!;
                                            _editNomorController.text =
                                                contactProvider.contacts[index]
                                                    ['nomor']!;
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text("Edit Data"),
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Form(
                                                    child: SizedBox(
                                                      height: 200.0,
                                                      child: Column(
                                                        children: <Widget>[
                                                          TextFormField(
                                                            controller:
                                                                _editNameController,
                                                            onChanged:
                                                                (value) {},
                                                            decoration:
                                                                InputDecoration(
                                                              labelText: "Name",
                                                              icon: const Icon(Icons
                                                                  .account_box),
                                                              hintText: "",
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                _editNomorController,
                                                            onChanged:
                                                                (value) {},
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  "Nomor",
                                                              icon: const Icon(
                                                                  Icons.call),
                                                              hintText: "",
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: 20.0),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                contactProvider
                                                                    .updateName(
                                                                        index,
                                                                        _editNameController
                                                                            .text);
                                                                contactProvider
                                                                    .updateNomor(
                                                                        index,
                                                                        _editNomorController
                                                                            .text);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                  "Update"),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            // Handle the case when the index is out of bounds
                                            print("Invalid index: $index");
                                          }
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: typograph,
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: typograph,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text("Hapus Akun"),
                                                content: const Text(
                                                    "Apakah Anda yakin untuk menghapus akun?"),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text("Batal"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: const Text("Hapus"),
                                                    onPressed: () {
                                                      setState(
                                                        () {
                                                          contactProvider
                                                              .remove(index);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
