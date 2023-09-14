import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
   EditNoteBody({super.key, required this.noteModel, required this.index});

  final NoteModel noteModel;
  String? title, subTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
            onTap: () {
              BlocProvider.of<NoteBloc>(context).add(
                EditNoteEvent(
                    noteModel: NoteModel(
                        title: title ?? noteModel.title,
                        subTitle: subTitle ?? noteModel.subTitle,
                        date: '22,may 2023',
                        color: noteModel.color),
                    index: index),
              );
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 50),
          CustomTextField(
              hintText: noteModel.title,
              onChanged: (value) {
                title = value;

              }),
          const SizedBox(height: 24),
          CustomTextField(
            hintText: noteModel.subTitle,
            maxLines: 5,
            onChanged: (value) {
              subTitle = value;
            },
          ),
        ],
      ),
    );
  }
}
