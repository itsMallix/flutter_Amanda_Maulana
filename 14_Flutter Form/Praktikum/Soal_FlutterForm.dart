import 'package:flutter/material.dart';

class Prioritas1 extends StatefulWidget {
  const Prioritas1({super.key});

  @override
  State<Prioritas1> createState() => _Prioritas1State();
}

class _Prioritas1State extends State<Prioritas1> {
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateNomorController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String? name = "";
  String? nomor = "";

  List<Data> dataList = [];

  bool isCapitalized(String s) {
    return s.isNotEmpty && s[0] == s[0].toUpperCase();
  } // validator upercase name

  bool isAlphaNumeric(String s) {
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(s);
  } // validator special char name

  bool isNumeric(String s) {
    return RegExp(r'^[0-9]+$').hasMatch(s);
  } // validator number only digit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff6750A4),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Container(
                  child: Icon(Icons.phonelink),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Create New Contact',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Text(
                    "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made",
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(),
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
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.person),
                                fillColor: Color(0xffe7e0ec),
                                filled: true,
                                label: const Text("Name"),
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
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.phone_android),
                                fillColor: Color(0xffe7e0ec),
                                filled: true,
                                label: const Text("Nomor"),
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
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Data Berhasil Ditambahkan"),
                                  ));
                                  dataList.add(Data(
                                    name: name,
                                    nomor: nomor,
                                  ));
                                  setState(() {
                                    formKey.currentState!.reset();
                                  });
                                }
                              },
                            ),
                          ),
                          Container(
                            child: const Text(
                              "List Contact",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          for (var i = 0; i < dataList.length; i++)
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        backgroundColor: Color(0xff6750A4)),
                                    title: Text(dataList[i].name.toString()),
                                    subtitle:
                                        Text(dataList[i].nomor.toString()),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            updateNameController.text =
                                                dataList[i].name.toString();
                                            updateNomorController.text =
                                                dataList[i].nomor.toString();
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: Text("Edit Data"),
                                                content: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Form(
                                                    child: Container(
                                                      height: 200.0,
                                                      child: Column(
                                                        children: <Widget>[
                                                          TextFormField(
                                                            controller:
                                                                updateNameController,
                                                            decoration: InputDecoration(
                                                                labelText:
                                                                    "Name",
                                                                icon: Icon(Icons
                                                                    .account_box),
                                                                hintText: dataList[
                                                                        i]
                                                                    .name
                                                                    .toString()),
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                updateNomorController,
                                                            decoration: InputDecoration(
                                                                labelText:
                                                                    "Nomor",
                                                                icon: Icon(
                                                                    Icons.call),
                                                                hintText: dataList[
                                                                        i]
                                                                    .nomor
                                                                    .toString()),
                                                          ),
                                                          SizedBox(
                                                              height: 20.0),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                String
                                                                    updatedName =
                                                                    updateNameController
                                                                        .text;
                                                                String
                                                                    updatedNomor =
                                                                    updateNomorController
                                                                        .text;

                                                                dataList[i]
                                                                        .name =
                                                                    updatedName;
                                                                dataList[i]
                                                                        .nomor =
                                                                    updatedNomor;
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                setState(() {});
                                                              },
                                                              child: Text(
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
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: Text("Hapus Akun"),
                                                content: Text(
                                                    "Apakah Anda yakin untuk menghapus akun?"),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text("Batal"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text("Hapus"),
                                                    onPressed: () {
                                                      setState(
                                                        () {
                                                          dataList.removeAt(i);
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
                                          icon: Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
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

class Data {
  String? name;
  String? nomor;

  Data({this.name, this.nomor});
}
