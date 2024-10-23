import 'package:flutter/material.dart';
import 'package:online_exam_c1_online/global/styles/colors.dart';

class Reusablebutton extends StatefulWidget {
  Reusablebutton({super.key, required this.text, this.onPressed});
  final String text;
  Function? onPressed;

  @override
  State<Reusablebutton> createState() => _ReusablebuttonState();
}

class _ReusablebuttonState extends State<Reusablebutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 48,
      decoration: BoxDecoration(
        color: colors.blueBaseColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: ElevatedButton(onPressed: () {}, child: Text(widget.text))),
    );
  }
}
