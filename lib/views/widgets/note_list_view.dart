import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_note_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NoteListView extends StatelessWidget {
  final List<Color> colorArray = const [
    Color(0xFFFF6633),
    Color(0xFFFFB399),
    Color(0xFFFF33FF),
    Color(0xFFFFFF99),
    Color(0xFF00B3E6),
    Color(0xFFE6B333),
    Color(0xFF3366E6),
    Color(0xFF999966),
    Color(0xFF99FF99),
    Color(0xFFB34D4D),
    Color(0xFFE6B3B3),
    Color(0xFF6680B3),
    Color(0xFF66991A),
    Color(0xFFFF99E6),
    Color(0xFFCCFF1A),
    Color(0xFFFF1A66),
    Color(0xFFE6331A),
    Color(0xFF33FFCC),
    Color(0xFF66994D),
    Color(0xFFB366CC),
    Color(0xFF4D8000),
    Color(0xFFB33300),
    Color(0xFFCC80CC),
    Color(0xFF66664D),
    Color(0xFF991AFF),
    Color(0xFFE666FF),
    Color(0xFF4DB3FF),
    Color(0xFF1AB399),
    Color(0xFFE666B3),
    Color(0xFF33991A),
    Color(0xFFCC9999),
    Color(0xFFB3B31A),
    Color(0xFF00E680),
    Color(0xFF4D8066),
    Color(0xFF809980),
    Color(0xFFE6FF80),
    Color(0xFF1AFF33),
    Color(0xFF999933),
    Color(0xFFFF3380),
    Color(0xFFCCCC00),
    Color(0xFF66E64D),
    Color(0xFF4D80CC),
    Color(0xFF9900B3),
    Color(0xFFE64D66),
    Color(0xFF4DB380),
    Color(0xFFFF4D4D),
    Color(0xFF99E6E6),
    Color(0xFF6666FF)
  ];
  final PagingController<int, NoteModel> pagingController ;
  const  NoteListView({super.key, required this.pagingController});

  //final List<NoteModel> noteModel;

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
        // noMoreItemsIndicatorBuilder: (context) => Center(
        //   child: Text(
        //     "No Notes Try Add Note",
        //     style: GoogleFonts.poppins(fontSize: 30),
        //   ),
        // ),
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
            ),
          );
        },
      ),
    );
  }
}
