import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustuomButton extends StatelessWidget {
  const CustuomButton({
    super.key,
    this.onTap,
    this.isLoding = false,
  });
  final void Function()? onTap;
  final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child:  Center(
            child:isLoding ? const CircularProgressIndicator(color: Colors.black,) :const Text(
              'Save',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          )),
    );
  }
}
