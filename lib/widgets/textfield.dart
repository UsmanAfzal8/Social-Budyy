import 'package:flutter/material.dart';

class Textfieldpage extends StatelessWidget {
  final TextEditingController textcontroller;
  final String hinttext;
  final String labeltext;
  final bool pass;
  final TextInputType texttype;
  const Textfieldpage(
      {Key? key,
      required this.textcontroller,
      required this.hinttext,
      required this.labeltext,
      this.pass = false,
      required this.texttype})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final varborder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
    return TextField(
      controller: textcontroller,
      decoration: InputDecoration(
        hintText: hinttext,
        labelText: labeltext,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        border: varborder,
        focusedBorder: varborder,
        enabledBorder: varborder,
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: texttype,
      obscureText: pass,
    );
  }
}
