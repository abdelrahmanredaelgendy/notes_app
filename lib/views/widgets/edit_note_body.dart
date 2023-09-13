import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomAppBar(title: "Edit Note", icon: Icons.check),
          SizedBox(height: 50),
          CustomTextField(hintText: "title"),
          SizedBox(height: 24),
          CustomTextField(
            hintText: "Content",
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
