import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel, required this.index});
  final NoteModel noteModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  EditNotView(noteModel: noteModel,index:index),
            ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 26, bottom: 26, left: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(noteModel.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                noteModel.title,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  noteModel.subTitle,
                  style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.5), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: () async{
                  BlocProvider.of<NoteBloc>(context).add(DeleteNoteEvent(noteModel: noteModel));
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                noteModel.date,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
