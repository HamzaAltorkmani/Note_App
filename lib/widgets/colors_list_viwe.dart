import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
      radius: 35,
      backgroundColor: Colors.white,
          child: CircleAvatar(
              backgroundColor: color,
              radius: 28,
            ),
        )
        : CircleAvatar(
            backgroundColor: color,
            radius: 32,
          );
  }
}

class ColorsListViwe extends StatefulWidget {
  const ColorsListViwe({super.key});

  @override
  State<ColorsListViwe> createState() => _ColorsListViweState();
}

class _ColorsListViweState extends State<ColorsListViwe> {

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  BlocProvider.of<AddNoteCubit>(context).color=kColors[index];
                  setState(() {});
                  },
                child: ColorItem(
                  color: kColors[index],
                  isActive: currentIndex==index,
                ),
              ),
            );
          }),
    );
  }
}
