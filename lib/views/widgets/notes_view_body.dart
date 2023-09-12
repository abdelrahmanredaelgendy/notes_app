import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 12,
        ),
        CustomAppBar(),
      ],
    );
  }
}
