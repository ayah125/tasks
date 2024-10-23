import 'package:flutter/material.dart';

import 'package:online_exam_c1_online/global/styles/colors.dart';
import 'package:online_exam_c1_online/global/styles/styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter(
      {Key? key,
      required this.question,
      required this.txt,
      required this.route})
      : super(key: key);
  final String question, txt, route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: styles.styleRegular14(context).copyWith(
                color: colors.blackBaseColor,
              ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Text(
            txt,
            style: styles.styleMedium16(context).copyWith(
                  color: colors.blueBaseColor,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}
