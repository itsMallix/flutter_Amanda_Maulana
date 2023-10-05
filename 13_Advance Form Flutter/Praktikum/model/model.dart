import 'package:flutter/material.dart';

class ContactData {
  String? contactName;
  String? phoneNumber;
  DateTime? birthDate;
  Color? chosenColor;
  String? selectedFile;

  ContactData(
      {this.contactName,
      this.phoneNumber,
      this.birthDate,
      this.chosenColor,
      this.selectedFile});
}
