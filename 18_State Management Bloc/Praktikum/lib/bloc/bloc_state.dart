part of 'bloc_contact.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {}

class ContactLoaded extends ContactState {
  final List<ContactModel> contacts;

  const ContactLoaded(this.contacts);

  @override
  List<Object> get props => [contacts];
}
