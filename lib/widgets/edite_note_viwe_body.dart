import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_fild.dart';
import 'package:notes_app/widgets/edite_note_color_list.dart';

class EditeNoteViweBody extends StatefulWidget {
  const EditeNoteViweBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditeNoteViweBody> createState() => _EditeNoteViweBodyState();
}

class _EditeNoteViweBodyState extends State<EditeNoteViweBody> {
  String? titel, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            text: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.titel = titel ?? widget.note.titel;
              widget.note.subTitel = content ?? widget.note.subTitel;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextFild(
            onChanged: (value) {
              titel = value;
            },
            hint: widget.note.titel,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFild(
            onChanged: (value) {
              content = value;
            },
            hint:widget.note.subTitel,
            maxLines: 5,
          ),
          SizedBox(height: 20,),
          Text('Edite Color =>',style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          EditeNoteColorList(note: widget.note,),
        ],
      ),
    ));
  }
}


