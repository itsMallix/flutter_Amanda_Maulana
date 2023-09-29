import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class Prioritas1 extends StatefulWidget {
  const Prioritas1({super.key});

  @override
  State<Prioritas1> createState() => _Prioritas1State();
}

class _Prioritas1State extends State<Prioritas1> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.pink.shade400;
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["jpg"],
    );
    if (result == null) return;
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Prioritas 1",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              BuildDatePicker(context),
              SizedBox(height: 20),
              BuildColorPicker(context),
              SizedBox(height: 20),
              Divider(),
              BuildFilePicker(),
            ],
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
        Text(DateFormat("dd-MM-yyy").format(_dueDate)),
      ],
    );
  }

  Widget BuildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Color"),
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
                  return AlertDialog(
                    title: const Text("Select Color"),
                    content: BlockPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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
