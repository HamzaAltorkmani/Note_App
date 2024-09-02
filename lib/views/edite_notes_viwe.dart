import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edite_note_viwe_body.dart';

class EditeNotesViwe extends StatelessWidget {
  const EditeNotesViwe({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditeNoteViweBody(note: note,),
    );
  }
}
