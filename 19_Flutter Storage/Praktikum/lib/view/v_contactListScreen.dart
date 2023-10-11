import 'package:coba_storage/component/v_contactCard.dart';
import 'package:coba_storage/model/m_db_manager.dart';
import 'package:coba_storage/view/v_contactItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  final DbManager manager;
  const ContactList({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final contactItems = manager.contactModels;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<DbManager>(builder: (context, manager, child) {
        final contactItems = manager.contactModels;
        return ListView.separated(
          itemCount: contactItems.length,
          itemBuilder: (context, index) {
            final item = contactItems[index];
            return InkWell(
              onTap: () async {
                final selectedTask = await manager.getContactById(item.id!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactItem(
                      contactModel: selectedTask,
                    ),
                  ),
                );
              },
              child: ContactCard(
                key: ValueKey(item.id),
                contact: item,
                onPressed: () {
                  manager.deleteContact(item.id!);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${item.contactName} Contact deleted"),
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 10.0,
            );
          },
        );
      }),
    );
  }
}
