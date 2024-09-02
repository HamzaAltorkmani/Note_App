import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild(
      {super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Filed Is Required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(kPrimaryColor),
        enabledBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
