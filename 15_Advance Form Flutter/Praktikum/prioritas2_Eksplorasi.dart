import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:open_file/open_file.dart';

class Prioritas2 extends StatefulWidget {
  const Prioritas2({super.key});

  @override
  State<Prioritas2> createState() => _Prioritas2State();
}

class _Prioritas2State extends State<Prioritas2> {
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateNomorController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  String? name = "";
  String? nomor = "";
  String? file = "";

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

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color _currentColor = Colors.pink.shade400;
  Color generateRandomColor() {
    Random random = Random();
    double randomDouble = random.nextDouble();
    return Color((randomDouble * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["jpg"],
    );
    if (result == null) return;
    setState(() {
      file = result.files.first.name;
    });
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

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
                          Column(
                            children: [
                              BuildDatePicker(
                                  context), //panggil widget datepicker
                              BuildColorPicker(
                                  context), //panggil widget colorpicekr
                              BuildFilePicker(), // panggil widget filepicker
                              SizedBox(height: 10.0),
                            ],
                          ),
                          Divider(), // garis pemisah
                          Container(
                            //membuat button
                            width: double.infinity,
                            margin: EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple),
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
                                  dataList.add(Data(
                                      // data yg akan di tambahkan ketika di submit
                                      name: name,
                                      nomor: nomor,
                                      file: file,
                                      color: _currentColor.value,
                                      date: _dueDate));
                                  setState(() {
                                    formKey.currentState!
                                        .reset(); // reset state
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
                          for (var i = 0;
                              i < dataList.length;
                              i++) // nampilin jumlah dari data inputan
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
                                      // circle avatar
                                      backgroundColor: Color(0xff6750A4),
                                      child: Text(
                                        dataList[i].name != null &&
                                                dataList[i].name!.isNotEmpty
                                            ? dataList[i].name![0].toUpperCase()
                                            : '', // nampilkan huruf pertama dari nama inputan
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    title: Text(dataList[i].name.toString()),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Nomor : " +
                                            dataList[i].nomor.toString()),
                                        Text("Date : " +
                                            DateFormat("dd-MM-yyyy").format(
                                                dataList[i].date ??
                                                    DateTime
                                                        .now())), // formatting date biar tida include waktu
                                        Row(
                                          children: [
                                            Text("Color : "),
                                            Container(
                                              width: 35.0,
                                              height: 15.0,
                                              color: Color(dataList[i].color ??
                                                  0xff0000),
                                            ),
                                          ],
                                        ),
                                        Text("File : " +
                                            (dataList[i].file ??
                                                "No file selected")),
                                      ],
                                    ),
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
                                              // munculin dialog ketika icon edit di tekan
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
                                                                    .toString()), // nampilin value name
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
                                                                    .toString()), // nampilin value nomor
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
                                                              .pop(); // menghapus value yang ditekan
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

  Widget BuildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date"),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  _dueDate = selectDate!;
                });
              },
              child: const Text("Select"),
            ),
          ],
        ),
        Text(DateFormat("dd-MM-yyyy").format(_dueDate)),
      ],
    );
  }

  Widget BuildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Container(
          height: 100.0,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 10.0),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: _currentColor),
            child: const Text(
              "Pick Color",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  Color selectedColor = _currentColor;
                  return AlertDialog(
                    title: const Text("Select Color"),
                    content: BlockPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        selectedColor = color;
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _currentColor = selectedColor;
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget BuildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pick Files"),
        const SizedBox(height: 10.0),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text("Pick and Open FIle"),
          ),
        ),
      ],
    );
  }
}

class Data {
  String? name;
  String? nomor;
  DateTime? date;
  int? color;
  String? file;

  Data({this.name, this.nomor, this.date, this.color, this.file});
}
