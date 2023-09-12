import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child:const  Icon(Icons.add)),
      body: const NotesBody(),
    ));
  }
}
