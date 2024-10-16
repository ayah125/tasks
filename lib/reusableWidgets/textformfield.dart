// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mytextformfield extends StatelessWidget {
  String hintText;
  String labelText;
  TextInputType? keyboardType;
  bool? obscureText;
  // Function? validatee;
  Mytextformfield({
    Key? key,
    // this.validatee,
    this.obscureText,
    this.keyboardType,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1 = Color.fromARGB(255, 18, 46, 120);
    return TextFormField(
      // validator: validatee!(String) ?? "",
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText ?? " ",
          labelText: labelText ?? "",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color1),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: color1,
              ),
              gapPadding: 4.0)),
      obscureText: obscureText ?? false,
    );
  }
}
