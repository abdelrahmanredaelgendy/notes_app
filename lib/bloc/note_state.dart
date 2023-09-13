part of 'note_bloc.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class AddNoteSuccess extends NoteState {}

class AddNoteFailure extends NoteState {}

class LoadNoteSuccess extends NoteState {
  final List<NoteModel> noteList;

  LoadNoteSuccess({required this.noteList});
}

class LoadNoteFailure extends NoteState {}

class DeleteNoteSuccess extends NoteState {}

class DeleteNoteFailure extends NoteState {}
//
// class EditNoteLoading extends NoteState {}
