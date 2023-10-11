import 'package:flutter/material.dart';
import 'package:coba_storage/model/m_contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  final Function() onPressed;
  const ContactCard(
      {super.key, required this.contact, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          radius: 20,
          child: Text(
            contact.contactName!.substring(0, 1).toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        title: Text(contact.contactName!),
        subtitle: Text(contact.contactNumber ?? "null"),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Delete Contact"),
                  content: const Text(
                      "Are you sure you want to delete this contact?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: onPressed,
                      child: const Text("Delete"),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      // child: Row(
      //   children: [
      //     Text(contact.contactName!),
      //     IconButton(
      //       onPressed: () {
      //         showDialog(
      //           context: context,
      //           builder: (context) {
      // return AlertDialog(
      //   title: const Text("Delete Task"),
      //   content: const Text(
      //       "Are you sure you want to delete this task?"),
      //   actions: [
      //     TextButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       child: const Text("Cancel"),
      //     ),
      //     TextButton(
      //       onPressed: onPressed,
      //       child: const Text("Delete"),
      //     ),
      //   ],
      // );
      //           },
      //         );
      //       },
      //       icon: const Icon(Icons.delete_forever),
      //     ),
      //   ],
      // ),
    );
  }
}
