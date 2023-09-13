part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}

<<<<<<< HEAD
class AddNoteEvent extends NoteEvent {
  final NoteModel noteModel;

  AddNoteEvent({required this.noteModel});
}

class DeleteNoteEvent extends NoteEvent {

}

class LoadDataEvent extends NoteEvent {}
=======
// class AddNoteEvent extends NoteEvent {
//   final NoteModel noteModel;
//
//   AddNoteEvent({required this.noteModel});
// }
// class EditNoteEvent extends NoteEvent {}
class LoadDataEvent extends NoteEvent{}
>>>>>>> origin/main
