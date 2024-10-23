import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/signupentity.dart';
import 'package:online_exam_c1_online/features/authFeature/presentation/cubit/cubit/auth_cubit.dart';
import 'package:online_exam_c1_online/features/authFeature/presentation/screens/EmailVerificationScreen%20.dart';
import 'package:online_exam_c1_online/global/styles/colors.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AuthCubit authCubit;
  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneNumberController;

  const SignUpButton({
    Key? key,
    required this.formKey,
    required this.authCubit,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneNumberController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          authCubit.signUp(
              SignUpEntity(
                username: usernameController.text.trim(),
                firstName: firstNameController.text.trim(),
                lastName: lastNameController.text.trim(),
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
                rePassword: confirmPasswordController.text.trim(),
                phone: phoneNumberController.text.trim(),
              ),
              context);
        }
      },
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthCubit>().signUp(SignUpEntity(), context);
          switch (AuthState) {
            case SignUpErrorState:
              {
                break;
              }
            case SignUpLoadingState():
              {
                break;
              }
            case SignUpSuccessState:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmailVerificationScreen()),
                );
              }
          }
        },
        child: Text(
          'Signup',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.blueBaseColor,
          elevation: 0, // Set button color
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
      ),
    );
  }
}
