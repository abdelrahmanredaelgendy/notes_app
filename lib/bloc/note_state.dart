part of 'note_bloc.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

// class AddNoteSuccess extends NoteState {
//   final Box<NoteModel> noteBox;
//
//   AddNoteSuccess({required this.noteBox});
// }

//class AddNoteFailure extends NoteState {}

class LoadNoteSuccess extends NoteState {
  final List<NoteModel> noteList;

  LoadNoteSuccess({required this.noteList});
}

class LoadNoteFailure extends NoteState {}

// class AddNoteLoading extends NoteState {}

// class EditNoteSuccess extends NoteState {}
//
// class EditNoteFailure extends NoteState {}
//
// class EditNoteLoading extends NoteState {}
