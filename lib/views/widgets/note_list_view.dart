import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_note_item.dart';

class NoteListView extends StatelessWidget {
  final PagingController<int, NoteModel> pagingController;

  const NoteListView({super.key, required this.pagingController});

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, NoteModel>(
      pagingController: pagingController,
      builderDelegate: PagedChildBuilderDelegate<NoteModel>(
        noItemsFoundIndicatorBuilder: (context) => Center(
          child: Text(
            "No Notes Try Add Note",
            style: GoogleFonts.poppins(fontSize: 30),
          ),
        ),
        firstPageErrorIndicatorBuilder: (context) => Center(
          child: Text(
            "Can not load data",
            style: GoogleFonts.poppins(fontSize: 30),
          ),
        ),
        firstPageProgressIndicatorBuilder: (context) =>
            const Center(child: CircularProgressIndicator()),
        itemBuilder: (context, item, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: NoteItem(
              noteModel: item,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
