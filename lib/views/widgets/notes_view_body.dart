import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/note_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  List<NoteModel> noteList = [];
  final PagingController<int, NoteModel> pagingController =
  PagingController(firstPageKey: 0);
  @override
  void initState() {
    
    pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<NoteBloc>(context).add(LoadDataEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CustomAppBar(
            title: "Notes",
            icon: Icons.search,
          ),
          BlocListener<NoteBloc, NoteState>(
            listener: (context, state) {
              if (state is LoadNoteSuccess) {
                noteList = state.noteList;
               pagingController
                    .appendLastPage(noteList);
                print(
                    'AddNote Load ${pagingController.itemList?.length}');
              } else if (state is DeleteNoteSuccess) {
               pagingController.refresh();
                print(
                    'AddNote Delete ${pagingController.itemList?.length}');
              } else if (state is AddNoteSuccess) {
               pagingController.refresh();
                print(
                    'AddNote AddNote ${pagingController.itemList?.length}');
              }
            },
            child:  Expanded(child: NoteListView(pagingController: pagingController,)),
          ),
        ],
      ),
    );
  }
}
