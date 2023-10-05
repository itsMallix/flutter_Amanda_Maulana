import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'model/model.dart';

class AdvanceForm extends StatefulWidget {
  const AdvanceForm({Key? key}) : super(key: key);

  @override
  State<AdvanceForm> createState() => _AdvanceFormState();
}

class _AdvanceFormState extends State<AdvanceForm> {
  String? updatedFileName;
  String? selectedFileName;

  // Color picker
  Color currentColor = Colors.pink;

  // Date picker
  DateTime _selectedDate = DateTime.now();
  final currentDate = DateTime.now();

  // Form key
  var formKey = GlobalKey<FormState>();
  String? contactName = "";
  String? phoneNumber;
  List<ContactData> contactList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Contact"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              children: [
                const Icon(Icons.phonelink),
                const SizedBox(height: 5.0),
                const Text(
                  "Create New Contact",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made",
                    style: TextStyle(fontSize: 14.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            contactName = value;
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            final nameParts = value.split(' ');
                            if (nameParts.length < 2) {
                              return 'The name must consist of at least 2 words';
                            }
                            for (final namePart in nameParts) {
                              if (namePart.isNotEmpty &&
                                  namePart[0] != namePart[0].toUpperCase()) {
                                return 'Every word must start with a capital letter';
                              }
                            }
                            final RegExp regex = RegExp(r'^[a-zA-Z\s]*$');

                            if (!regex.hasMatch(value)) {
                              return 'The name must not contain numbers or special characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "+62",
                            hintText: "Enter your Number",
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            phoneNumber = value;
                            if (value == null || value.isEmpty) {
                              return "Please enter your Nomor";
                            }
                            final RegExp regex = RegExp(r'^[0-9]*$');

                            if (!regex.hasMatch(value)) {
                              return 'Telephone numbers can only consist of numbers';
                            }

                            if (value.length < 8 || value.length > 15) {
                              return 'The length of the telephone number must be a minimum of 8 digits and a maximum of 15 digits';
                            }

                            if (!value.startsWith('0')) {
                              return 'Telephone numbers must start with the digit 0';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        buildDatePicker(
                          context,
                          _selectedDate,
                          (newDate) {
                            setState(() {
                              _selectedDate = newDate;
                            });
                          },
                        ),
                        const SizedBox(height: 10.0),
                        buildColorPicker(context),
                        const SizedBox(height: 10.0),
                        buildFilePicker(selectedFileName),
                        const SizedBox(height: 10.0),
                        Container(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurple),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Data berhasil disimpan"),
                                  ),
                                );
                                contactList.add(ContactData(
                                  contactName: contactName,
                                  phoneNumber: phoneNumber,
                                  birthDate: _selectedDate,
                                  chosenColor: currentColor,
                                  selectedFile: selectedFileName,
                                ));

                                setState(() {});

                                formKey.currentState!.reset();

                                setState(() {
                                  _selectedDate = DateTime.now();
                                  currentColor = Colors.pink;
                                  selectedFileName = null;
                                });
                              }
                            },
                            child: const Text("Submit"),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          "List Contact",
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: contactList.length,
                          itemBuilder: (context, index) {
                            String contactName =
                                contactList[index].contactName ?? "";
                            String avatarText =
                                contactName.substring(0, 1).toUpperCase();
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.deepPurple,
                                radius: 20,
                                child: Text(
                                  avatarText,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text(
                                contactName,
                                style: const TextStyle(fontSize: 15.0),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contactList[index].phoneNumber.toString(),
                                    style: const TextStyle(
                                        fontSize: 15.0, color: Colors.grey),
                                  ),
                                  if (contactList[index].birthDate != null) ...[
                                    Text(
                                      "Date: ${DateFormat('dd-MM-yyyy').format(contactList[index].birthDate!)}",
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                  Row(
                                    children: [
                                      const Text("Color = "),
                                      Container(
                                        width: 40,
                                        height: 20,
                                        color: contactList[index].chosenColor ??
                                            Colors.pink,
                                      ),
                                    ],
                                  ),
                                  if (contactList[index].selectedFile !=
                                      null) ...[
                                    Text(
                                      "File Name = ${contactList[index].selectedFile}",
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      contactList.removeAt(index);
                                      setState(() {});
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      _editContact(context, contactList,
                                          contactList[index], index, () {
                                        setState(() {});
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: currentColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(currentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pick Your Color'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                          pickerColor: currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              currentColor = color;
                            });
                          }),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Pick Color'),
          ),
        ),
      ],
    );
  }

  Widget buildDatePicker(BuildContext context, DateTime selectedDate,
      Function(DateTime) onDateSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () async {
                final newDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(DateTime.now().year + 5),
                );

                if (newDate != null) {
                  onDateSelected(newDate);
                }
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_selectedDate),
        )
      ],
    );
  }

  void _editColor(BuildContext context, ContactData contact,
      Function(Color) setColorCallback) {
    Color currentColor = contact.chosenColor ?? Colors.orange;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Color"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ColorPicker(
                  pickerColor: currentColor,
                  onColorChanged: (newColor) {
                    currentColor = newColor;
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Simpan warna yang dipilih
                setColorCallback(currentColor);

                // Tutup dialog
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    final nameParts = value.split(' ');
    if (nameParts.length < 2) {
      return 'The name must consist of at least 2 words';
    }
    for (final namePart in nameParts) {
      if (namePart.isNotEmpty && namePart[0] != namePart[0].toUpperCase()) {
        return 'Every word must start with a capital letter';
      }
    }
    final RegExp regex = RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$');

    if (!regex.hasMatch(value)) {
      return 'The name must not contain numbers or special characters';
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Nomor";
    }
    final RegExp regex = RegExp(r'^[0-9]*$');

    if (!regex.hasMatch(value)) {
      return 'Telephone numbers can only consist of numbers';
    }

    if (value.length < 8 || value.length > 15) {
      return 'The length of the telephone number must be a minimum of 8 digits and a maximum of 15 digits';
    }

    if (!value.startsWith('0')) {
      return 'Telephone numbers must start with the digit 0';
    }

    return null;
  }

  Widget buildFilePicker(String? initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pick Files"),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFiles(initialValue);
            },
            child: const Text("Pick and Open Files"),
          ),
        ),
      ],
    );
  }

  void _pickFiles(String? initialValue) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      selectedFileName = file.name;
    });
    updatedFileName = selectedFileName;
    _openFiles(file);
  }

  void _openFiles(PlatformFile file) {
    // Simpan path file ke dalam contactList saat file dipilih
    contactList.add(ContactData(
      contactName: contactName,
      phoneNumber: phoneNumber,
      birthDate: _selectedDate,
      chosenColor: currentColor,
      selectedFile: file.path, // Simpan path file di sini
    ));
    setState(() {});
  }

  void _editContact(BuildContext context, List<ContactData> contactList,
      ContactData contact, int index, VoidCallback setStateCallback) {
    String updatedContactName = contact.contactName ?? "";
    String updatedPhoneNumber = contact.phoneNumber ?? "";
    DateTime? updatedBirthDate = contact.birthDate;
    String? updatedFileName = contact.selectedFile;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime selectedDate = updatedBirthDate ?? DateTime.now();

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Edit Contact"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      initialValue: updatedContactName,
                      onChanged: (value) {
                        updatedContactName = value;
                      },
                      validator: validateName,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Nomor Telepon'),
                      initialValue: updatedPhoneNumber,
                      onChanged: (value) {
                        updatedPhoneNumber = value;
                      },
                      validator: validatePhoneNumber,
                    ),
                    buildDatePicker(
                      context,
                      selectedDate,
                      (newDate) {
                        setState(() {
                          selectedDate = newDate;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _editColor(context, contactList[index], (newColor) {
                          setState(() {
                            contactList[index].chosenColor = newColor;
                          });
                        });
                      },
                      child: const Text("Edit Color"),
                    ),
                    buildFilePicker(updatedFileName),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    final nameError = validateName(updatedContactName);
                    final numberError = validatePhoneNumber(updatedPhoneNumber);

                    if (nameError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(nameError),
                        ),
                      );
                    } else if (numberError != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(numberError),
                        ),
                      );
                    } else {
                      if (validateName(updatedContactName) == null &&
                          validatePhoneNumber(updatedPhoneNumber) == null) {
                        // Perbarui objek ContactData dalam contactList
                        contactList[index].contactName = updatedContactName;
                        contactList[index].phoneNumber = updatedPhoneNumber;
                        contactList[index].birthDate = selectedDate;
                        contactList[index].selectedFile =
                            updatedFileName; // Perbarui file di sini

                        // Tutup dialog
                        Navigator.of(context).pop();

                        setStateCallback();
                      }
                    }
                  },
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
