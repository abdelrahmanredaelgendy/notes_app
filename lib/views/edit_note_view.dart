import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/edit_note_body.dart';

class EditNotView extends StatelessWidget {
  const EditNotView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: EditNoteBody(),
      ),
    );
  }
}
