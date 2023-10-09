import 'package:flutter/material.dart';
import 'package:coba_bloc/17_Assets/models/m_contact.dart';

class ContactController with ChangeNotifier {
  final _contacts = <ContactModel>[];

  List<ContactModel> get contacts => _contacts;

  void add(ContactModel contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void remove(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void update(int index, String name, String number, String date, Color color,
      String filepath) {
    _contacts[index] = ContactModel(
      contactName: name,
      phoneNumber: number,
      birthDate: DateTime.parse(date),
      chosenColor: color,
      selectedFile: filepath,
    );
    notifyListeners();
  }
}
