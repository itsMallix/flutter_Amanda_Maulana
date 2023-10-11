import 'package:coba_storage/model/m_db_manager.dart';
import 'package:coba_storage/model/m_contact_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatefulWidget {
  final ContactModel? contactModel;
  const ContactItem({super.key, this.contactModel});

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isUpdate = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.contactModel != null) {
      _nameController.text = widget.contactModel!.contactName!;
      _phoneController.text = widget.contactModel!.contactNumber!;
      _isUpdate = true;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Contact',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const Icon(Icons.phonelink),
            const SizedBox(height: 5.0),
            const Text(
              "Create New Contact",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                textAlign: TextAlign.center,
                "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made",
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(height: 10.0),
            Divider(),
            buildNameField(),
            const SizedBox(height: 10.0),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Contact Name"),
        const SizedBox(height: 10.0),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Contact Name",
          ),
        ),
        const SizedBox(height: 10.0),
        const Text("Contact Phone Number"),
        const SizedBox(height: 10.0),
        TextField(
          controller: _phoneController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "+62...",
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      child: const Text(
        "Create",
        style: TextStyle(
          color: Colors.deepPurple,
        ),
      ),
      onPressed: () {
        if (!_isUpdate) {
          final thisContact = ContactModel(
              contactName: _nameController.text,
              contactNumber: _phoneController.text);
          Provider.of<DbManager>(context, listen: false)
              .addContact(thisContact);
        } else {
          final thisContact = ContactModel(
            id: widget.contactModel!.id,
            contactName: _nameController.text,
            contactNumber: _phoneController.text,
          );
          Provider.of<DbManager>(context, listen: false)
              .updateContact(thisContact);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Contact updated"),
            ),
          );
        }
      },
    );
  }
}
