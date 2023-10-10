import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:coba_bloc/models/m_contact.dart';

part 'package:coba_bloc/bloc/bloc_event.dart';
part 'package:coba_bloc/bloc/bloc_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<ContactModel> _contacts = [];

  ContactBloc() : super(ContactInitial()) {
    on<GetContactEvent>((event, emit) {
      emit(ContactLoaded(_contacts));
    });

    on<AddContactEvent>((event, emit) {
      _contacts.add(event.contact);
      emit(ContactLoaded(_contacts));
    });

    on<UpdateContactEvent>((event, emit) {
      int index = _contacts
          .indexWhere((contact) => contact.name == event.oldContact.name);
      if (index != -1) {
        _contacts[index] = event.newContact;
        emit(ContactLoaded(_contacts));
      }
    });

    on<DeleteContactEvent>((event, emit) {
      _contacts.removeWhere((contact) => contact.name == event.name);
      emit(ContactLoaded(_contacts));
    });
  }
}
