import 'package:flutter/material.dart';

class ContactData with ChangeNotifier {
  List<Map<String, String>> _contacts = [];

  List<Map<String, String>> get contacts => _contacts;

  void add(Map<String, String> contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void remove(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void updateName(int index, String newName) {
    _contacts[index]['name'] = newName;
    notifyListeners();
  }

  void updateNomor(int index, String newNomor) {
    _contacts[index]['nomor'] = newNomor;
    notifyListeners();
  }
}
