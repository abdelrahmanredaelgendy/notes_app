import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:note_app/constants.dart';

import '../models/note_model.dart';

part 'note_event.dart';

part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  var noteBox = Hive.box<NoteModel>(kNotesBox);


  NoteBloc() : super(NoteInitial()) {
    on<LoadDataEvent>((event, emit) {
      List<NoteModel> noteList = noteBox.values.toList();
      if (noteList.isNotEmpty) {
        emit(LoadNoteSuccess(noteList: noteList));
      } else {
        emit(LoadNoteFailure());
      }
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
    });
  }
}
