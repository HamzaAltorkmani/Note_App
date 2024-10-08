import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_viwe.dart';

class EditeNoteColorList extends StatefulWidget {
  const EditeNoteColorList({super.key, required this.note});
  final  NoteModel note;
  @override
  State<EditeNoteColorList> createState() => _EditeNoteColorListState();
}

class _EditeNoteColorListState extends State<EditeNoteColorList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex=kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 32 * 2,
        child: ListView.builder(
            itemCount: kColors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: (){
                    currentIndex=index;
                    widget.note.color =kColors[index].value;
                    setState(() {});
                  },
                  child: ColorItem(
                    color: kColors[index],
                    isActive: currentIndex==index,
                  ),
                ),
              );
            }),
      ),
    );
  }
}