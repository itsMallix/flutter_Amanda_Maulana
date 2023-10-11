import 'package:coba_storage/helper/db_helper.dart';
import 'package:coba_storage/model/m_contact_model.dart';
import 'package:flutter/material.dart';

class DbManager extends ChangeNotifier {
  List<ContactModel> contactModels = [];
  late DatabaseHelper _dbHelper;

  List<ContactModel> get contacts => contactModels;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllAction();
  }

  void _getAllAction() async {
    contactModels = await _dbHelper.getContacts();
    notifyListeners();
  }

  Future<void> addContact(ContactModel contactModel) async {
    await _dbHelper.instertContact(contactModel);
    _getAllAction();
  }

  Future<ContactModel> getContactById(int id) async {
    return await _dbHelper.getContactById(id);
  }

  void updateContact(ContactModel contactModel) async {
    await _dbHelper.updateContact(contactModel);
    _getAllAction();
  }

  void deleteContact(int id) async {
    await _dbHelper.deleteTask(id);
    _getAllAction();
  }
}
