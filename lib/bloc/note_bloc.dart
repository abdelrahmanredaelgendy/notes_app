import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constants.dart';

import '../models/note_model.dart';

part 'note_event.dart';

part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<LoadDataEvent>((event, state) async {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(NoteModel(
          date: "date",
          title: "title",
          subTitle: "subTitle",
          color: 0xffffcc80));
      List<NoteModel> noteList = noteBox.values.toList();
      if (noteList.isNotEmpty) {
        emit(LoadNoteSuccess(noteList: noteList));
      } else {
        emit(LoadNoteFailure());
      }

      // if (event is AddNoteEvent) {
      //   emit(AddNoteLoading());
      //   if (state is AddNoteSuccess) {
      //   } else if (state is AddNoteFailure) {}
      // }
    });
  }
}
