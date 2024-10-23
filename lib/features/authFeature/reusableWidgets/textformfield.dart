// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mytextformfield extends StatefulWidget {
  String hintText;
  String labelText;
  TextInputType? keyboardType;
  bool? obscureText;
  final dynamic controller;
  final String? Function(String?)? validator;

  Mytextformfield(
      {Key? key,
      // this.validatee,
      this.obscureText,
      this.keyboardType,
      required this.hintText,
      required this.labelText,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  State<Mytextformfield> createState() => _MytextformfieldState();
}

class _MytextformfieldState extends State<Mytextformfield> {
  @override
  Widget build(BuildContext context) {
    Color color1 = Color.fromARGB(255, 18, 46, 120);
    return TextFormField(
      validator: widget.validator,
      // validator: validatee!(String) ?? "",
      keyboardType: widget.keyboardType,

      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hintText ?? " ",
          labelText: widget.labelText ?? "",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color1),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: color1,
              ),
              gapPadding: 4.0)),
      obscureText: widget.obscureText ?? false,
    );
  }
}
