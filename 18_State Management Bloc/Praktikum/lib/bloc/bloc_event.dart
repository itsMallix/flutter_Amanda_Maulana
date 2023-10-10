part of 'bloc_contact.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContactEvent extends ContactEvent {}

class AddContactEvent extends ContactEvent {
  final ContactModel contact;

  const AddContactEvent(this.contact);

  @override
  List<Object> get props => [contact];
}

class UpdateContactEvent extends ContactEvent {
  final ContactModel oldContact;
  final ContactModel newContact;

  const UpdateContactEvent(this.oldContact, this.newContact);

  @override
  List<Object> get props => [oldContact, newContact];
}

class DeleteContactEvent extends ContactEvent {
  final String name;

  const DeleteContactEvent(this.name);

  @override
  List<Object> get props => [name];
}
