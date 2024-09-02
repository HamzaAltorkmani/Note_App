import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edite_notes_viwe.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  EditeNotesViwe(note: note,);
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color:  Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              title:  Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  note.titel,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  note.subTitel,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  note.date,
                  style: TextStyle(color: Colors.black.withOpacity(0.4)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
