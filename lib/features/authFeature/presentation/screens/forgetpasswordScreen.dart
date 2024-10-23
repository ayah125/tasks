import 'package:flutter/material.dart';
import 'package:online_exam_c1_online/features/authFeature/presentation/screens/EmailVerificationScreen%20.dart';
import 'package:online_exam_c1_online/global/styles/colors.dart';
import 'package:online_exam_c1_online/global/styles/styles.dart';

import 'package:online_exam_c1_online/validators/validators.dart';

class Forgetpasswordscreen extends StatefulWidget {
  const Forgetpasswordscreen({super.key});

  @override
  State<Forgetpasswordscreen> createState() => _ForgetpasswordscreenState();
}

class _ForgetpasswordscreenState extends State<Forgetpasswordscreen> {
  final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Password'),
        ),
        body: Column(
          children: [
            Column(
              children: [
                Center(
                    child: Text(
                  'Forgot Password',
                  style: styles.styleMedium18(context),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'please enter your email associated to your account',
                    style: styles.styleRegular14(context).copyWith(
                          color: colors.grayColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors.blueBaseColor),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: colors.blueBaseColor,
                          ),
                          gapPadding: 4.0)),
                  validator: (value) =>
                      Validators.validateEmail(value, context) ??
                      "Please enter a valid email",
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Container(
                  width: 343,
                  height: 48,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colors.blueBaseColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailVerificationScreen()),
                        );
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      )),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
