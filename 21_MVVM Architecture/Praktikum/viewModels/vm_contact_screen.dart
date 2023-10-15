import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/m_contact_model.dart';

class ContactViewModel extends ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void updateContact(Contact contact, String newName, String newPhoneNumber) {
    final index = _contacts.indexOf(contact);
    if (index != -1) {
      _contacts[index].name = newName;
      _contacts[index].phoneNumber = newPhoneNumber;
      notifyListeners();
    }
  }

  void deleteContact(Contact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }
}
