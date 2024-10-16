import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_c1_online/di/di.dart';
import 'package:online_exam_c1_online/presentation/cubit/cubit/auth_cubit.dart';
import 'package:online_exam_c1_online/reusableWidgets/customToast.dart';
import 'package:online_exam_c1_online/reusableWidgets/textformfield.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthCubit authCubit = getIt.get<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => authCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Handle back button press
            },
          ),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state) {
              case SignUpLoadingState():
                {
                  CustomToast.showLoadingToast(message: 'Loading');
                  break;
                }
              case SignUpErrorState():
                {
                  CustomToast.showLoadingToast(message: 'Error');
                  break;
                }
              case SignUpSuccessState():
                {
                  CustomToast.showSuccessToast(message: "Success");
                  break;
                  //Navigate to login screen
                }

              default:
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                top: 56,
                left: 16,
                right: 16,
              ),
              child: SignUpForm(),
            );
          },
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color color1 = Color.fromARGB(255, 18, 46, 120);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Mytextformfield(
            labelText: 'User name',
            hintText: 'Enter your user name',
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Mytextformfield(
                  labelText: 'First name',
                  hintText: 'Enter first name',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Mytextformfield(
                  labelText: 'Last name',
                  hintText: 'Enter last name',
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color1),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: color1,
                    ),
                    gapPadding: 4.0)),
            validator: (value) => EmailValidator.validate(value!)
                ? null
                : "Please enter a valid email",
          ),
          SizedBox(height: 10),
          Mytextformfield(
            labelText: 'Password',
            hintText: 'Enter password',
            obscureText: true,
          ),
          SizedBox(height: 10),
          Mytextformfield(
            labelText: 'Confirm password',
            hintText: 'Confirm password',
            obscureText: true,
          ),
          SizedBox(height: 10),
          Mytextformfield(
            labelText: 'Phone number',
            hintText: 'Enter phone number',
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Process sign-up
              }
            },
            child: Text(
              'Signup',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: color1,
              elevation: 0, // Set button color
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Handle login redirect
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  ' Login',
                  style: TextStyle(color: Color.fromARGB(255, 18, 46, 120)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
