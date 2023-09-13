import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constants.dart';
import '../models/note_model.dart';

part 'note_event.dart';

part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  var noteBox = Hive.box<NoteModel>(kNotesBox);

  NoteBloc() : super(NoteInitial()) {
    on<LoadDataEvent>((event, emit) async {
      List<NoteModel> noteList = noteBox.values.toList();
      try {
        emit(LoadNoteSuccess(noteList: noteList));
      } catch (e) {
        emit(LoadNoteFailure());
      }
    });
    on<AddNoteEvent>((event, emit) async {
      try {
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
