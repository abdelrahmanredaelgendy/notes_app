import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) {
          return const NoteItem();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 12,
        ),
        itemCount: 12);
  }
}
