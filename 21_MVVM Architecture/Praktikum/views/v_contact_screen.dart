import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/m_contact_model.dart';
import 'package:flutter_mvvm/viewModels/vm_contact_screen.dart';
import 'package:provider/provider.dart';

class ContactListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contacts = Provider.of<ContactViewModel>(context).contacts;

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kontak'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<ContactViewModel>(context, listen: false)
                    .deleteContact(contact);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddContactView(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddContactView extends StatelessWidget {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kontak Baru'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final phoneNumber = _phoneController.text;
                if (name.isNotEmpty && phoneNumber.isNotEmpty) {
                  final contactViewModel =
                      Provider.of<ContactViewModel>(context, listen: false);
                  contactViewModel.addContact(
                    Contact(
                      id: DateTime.now().toString(),
                      name: name,
                      phoneNumber: phoneNumber,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
