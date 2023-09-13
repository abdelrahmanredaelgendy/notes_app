import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/note_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  String? title, subTitle;
  var rng = Random();

  final List<int> colorArray = const [
    0xFFFF6633,
    0xFFFFB399,
    0xFFFF33FF,
    0xFFFFFF99,
    0xFF00B3E6,
    0xFFE6B333,
    0xFF3366E6,
    0xFF999966,
    0xFF99FF99,
    0xFFB34D4D,
    0xFFE6B3B3,
    0xFF6680B3,
    0xFF66991A,
    0xFFFF99E6,
    0xFFCCFF1A,
    0xFFFF1A66,
    0xFFE6331A,
    0xFF33FFCC,
    0xFF66994D,
    0xFFB366CC,
    0xFF4D8000,
    0xFFB33300,
    0xFFCC80CC,
    0xFF66664D,
    0xFF991AFF,
    0xFFE666FF,
    0xFF4DB3FF,
    0xFF1AB399,
    0xFFE666B3,
    0xFF33991A,
    0xFFCC9999,
    0xFFB3B31A,
    0xFF00E680,
    0xFF4D8066,
    0xFF809980,
    0xFFE6FF80,
    0xFF1AFF33,
    0xFF999933,
    0xFFFF3380,
    0xFFCCCC00,
    0xFF66E64D,
    0xFF4D80CC,
    0xFF9900B3,
    0xFFE64D66,
    0xFF4DB380,
    0xFFFF4D4D,
    0xFF99E6E6,
    0xFF6666FF
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidate,
      child: Column(
        children: [
          CustomTextField(
              hintText: "title",
              onSaved: (value) {
                title = value;
              }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: "Content",
            onSaved: (value) {
              subTitle = value;
            },
            maxLines: 5,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<NoteBloc>(context).add(
                  AddNoteEvent(
                    noteModel: NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: '22,may 2023',
                        color: colorArray[rng.nextInt(colorArray.length)]),
                  ),
                );
                Navigator.pop(context);
              } else {
                autovalidate = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
