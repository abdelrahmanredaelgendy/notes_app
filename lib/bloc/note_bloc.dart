import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
<<<<<<< HEAD
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
=======
>>>>>>> origin/main
import 'package:note_app/constants.dart';

import '../models/note_model.dart';

part 'note_event.dart';

part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
<<<<<<< HEAD
  var noteBox = Hive.box<NoteModel>(kNotesBox);


  NoteBloc() : super(NoteInitial()) {
    on<LoadDataEvent>((event, emit) {
=======
  NoteBloc() : super(NoteInitial()) {
    on<LoadDataEvent>((event, state) async {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(NoteModel(
          date: "date",
          title: "title",
          subTitle: "subTitle",
          color: 0xffffcc80));
>>>>>>> origin/main
      List<NoteModel> noteList = noteBox.values.toList();
      if (noteList.isNotEmpty) {
        emit(LoadNoteSuccess(noteList: noteList));
      } else {
        emit(LoadNoteFailure());
      }
<<<<<<< HEAD
    });
    on<AddNoteEvent>((event, emit) async {
      try {
        // if (noteBox.values.toList().isEmpty) {
        //   await Hive.openBox<NoteModel>(kNotesBox);
        //   await noteBox.add(event.noteModel);
        //   emit(AddNoteSuccess());
        // }
        await noteBox.add(event.noteModel);
        emit(AddNoteSuccess());
      } catch (e) {
        emit(AddNoteFailure());
      }
    });
    on<DeleteNoteEvent>((event, emit) async {
      try {
        emit(DeleteNoteSuccess());
      } catch (e) {
        emit(DeleteNoteFailure());
      }
=======

      // if (event is AddNoteEvent) {
      //   emit(AddNoteLoading());
      //   if (state is AddNoteSuccess) {
      //   } else if (state is AddNoteFailure) {}
      // }
>>>>>>> origin/main
    });
  }
}
