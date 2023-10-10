import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ContactModel extends Equatable {
  final String name;
  final String phoneNumber;

  ContactModel({
    required this.name,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [name, phoneNumber];
}
