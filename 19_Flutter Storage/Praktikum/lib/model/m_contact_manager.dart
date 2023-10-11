import 'package:coba_storage/model/m_contact_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContactManager extends ChangeNotifier {
  final _contactModel = <ContactModel>[];

  List<ContactModel> get contactModels => List.unmodifiable(_contactModel);

  void deleteContact(int index) {
    _contactModel.removeAt(index);
    notifyListeners();
  }

  void addContact(ContactModel contactModel) {
    _contactModel.add(contactModel);
    notifyListeners();
  }
}
