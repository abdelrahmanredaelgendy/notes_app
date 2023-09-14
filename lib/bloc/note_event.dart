part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}

class AddNoteEvent extends NoteEvent {
  final NoteModel noteModel;

  AddNoteEvent({required this.noteModel});
}

class DeleteNoteEvent extends NoteEvent {
  final NoteModel noteModel;

  DeleteNoteEvent({required this.noteModel});
}

class LoadDataEvent extends NoteEvent {}

class EditNoteEvent extends NoteEvent {
  final NoteModel noteModel;
  final int index;

  EditNoteEvent({required this.index, required this.noteModel});
}
