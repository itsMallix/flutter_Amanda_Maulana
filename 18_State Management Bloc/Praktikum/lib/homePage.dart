import 'package:coba_bloc/bloc/bloc_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coba_bloc/models/m_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _updateNameController = TextEditingController();
  final _updatePhoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Bloc",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocConsumer<ContactBloc, ContactState>(
        listener: (context, state) {
          if (state is ContactLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Contact Added"),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  const Icon(Icons.phonelink),
                  const SizedBox(height: 5.0),
                  const Text(
                    "Create New Contact",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              validator: validateName,
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              validator: validatePhoneNumber,
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                labelText: "Phone Number",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<ContactBloc>(context)
                                    .add(AddContactEvent(ContactModel(
                                  name: _nameController.text,
                                  phoneNumber: _phoneController.text,
                                )));
                                _nameController.clear();
                                _phoneController.clear();
                                setState(() {});
                              }
                            },
                            child: const Text('Add Contact'),
                          ),
                          SizedBox(height: 10),
                          if (state is ContactLoaded)
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.contacts.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.purple.shade100,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: ListTile(
                                      title: Text(state.contacts[index].name),
                                      subtitle: Text(
                                          state.contacts[index].phoneNumber),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Edit
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                _updateNameController.text =
                                                    state.contacts[index].name;
                                                _updatePhoneController.text =
                                                    state.contacts[index]
                                                        .phoneNumber;
                                                showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Edit Contact'),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                _updateNameController,
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Name'),
                                                          ),
                                                          TextField(
                                                            controller:
                                                                _updatePhoneController,
                                                            decoration:
                                                                const InputDecoration(
                                                                    labelText:
                                                                        'Phone Number'),
                                                          ),
                                                        ],
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    dialogContext)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            BlocProvider.of<
                                                                        ContactBloc>(
                                                                    context)
                                                                .add(
                                                              UpdateContactEvent(
                                                                ContactModel(
                                                                  name: state
                                                                      .contacts[
                                                                          index]
                                                                      .name,
                                                                  phoneNumber: state
                                                                      .contacts[
                                                                          index]
                                                                      .phoneNumber,
                                                                ),
                                                                ContactModel(
                                                                  name:
                                                                      _updateNameController
                                                                          .text,
                                                                  phoneNumber:
                                                                      _updatePhoneController
                                                                          .text,
                                                                ),
                                                              ),
                                                            );
                                                            _updateNameController
                                                                .clear();
                                                            _updatePhoneController
                                                                .clear();
                                                            Navigator.of(
                                                                    dialogContext)
                                                                .pop();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                  content: Text(
                                                                      'Contact Updated!')),
                                                            );
                                                            setState(() {});
                                                          },
                                                          child: const Text(
                                                              'Update'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Confirm Delete'),
                                                    content: Text(
                                                        'Are you sure you want to delete ${state.contacts[index].name}?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(
                                                                  dialogContext)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          BlocProvider.of<
                                                                      ContactBloc>(
                                                                  context)
                                                              .add(
                                                            DeleteContactEvent(
                                                                state
                                                                    .contacts[
                                                                        index]
                                                                    .name),
                                                          );
                                                          Navigator.of(
                                                                  dialogContext)
                                                              .pop();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'Contact Deleted!')),
                                                          );
                                                          setState(() {});
                                                        },
                                                        child: const Text(
                                                            'Delete'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
