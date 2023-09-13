part of 'note_bloc.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

<<<<<<< HEAD
class AddNoteSuccess extends NoteState {}

class AddNoteFailure extends NoteState {}
=======
// class AddNoteSuccess extends NoteState {
//   final Box<NoteModel> noteBox;
//
//   AddNoteSuccess({required this.noteBox});
// }

//class AddNoteFailure extends NoteState {}
>>>>>>> origin/main

class LoadNoteSuccess extends NoteState {
  final List<NoteModel> noteList;

  LoadNoteSuccess({required this.noteList});
}

class LoadNoteFailure extends NoteState {}

<<<<<<< HEAD
class DeleteNoteSuccess extends NoteState {}

class DeleteNoteFailure extends NoteState {}
=======
// class AddNoteLoading extends NoteState {}

// class EditNoteSuccess extends NoteState {}
//
// class EditNoteFailure extends NoteState {}
>>>>>>> origin/main
//
// class EditNoteLoading extends NoteState {}
