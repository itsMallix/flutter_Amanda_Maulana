import 'package:flutter/material.dart';

class ContactModel {
  String? contactName;
  String? phoneNumber;
  DateTime? birthDate;
  Color? chosenColor;
  String? selectedFile;

  ContactModel(
      {this.contactName,
      this.phoneNumber,
      this.birthDate,
      this.chosenColor,
      this.selectedFile});
}
