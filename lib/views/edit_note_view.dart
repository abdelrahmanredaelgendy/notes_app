import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/edit_note_body.dart';

class EditNotView extends StatelessWidget {
  const EditNotView({super.key, required this.noteModel, required this.index});
  final NoteModel noteModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: EditNoteBody(noteModel: noteModel,index:index),
      ),
    );
  }
}
