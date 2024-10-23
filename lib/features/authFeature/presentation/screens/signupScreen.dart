import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_c1_online/di/di.dart';
import 'package:online_exam_c1_online/features/authFeature/presentation/cubit/cubit/auth_cubit.dart';
import 'package:online_exam_c1_online/global/routes/routesname.dart';
import 'package:online_exam_c1_online/features/authFeature/reusableWidgets/customToast.dart';
import 'package:online_exam_c1_online/features/authFeature/reusableWidgets/signupButton.dart';
import 'package:online_exam_c1_online/features/authFeature/reusableWidgets/textformfield.dart';
import 'package:online_exam_c1_online/validators/validators.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  AuthCubit authCubit = getIt.get<AuthCubit>();

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
            validator: (value) => Validators.validateUserName(value, context),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Mytextformfield(
                  labelText: 'First name',
                  hintText: 'Enter first name',
                  validator: (value) =>
                      Validators.validateFirstName(value, context) ??
                      "Please enter a valid email",
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Mytextformfield(
                  labelText: 'Last name',
                  hintText: 'Enter last name',
                  validator: (value) =>
                      Validators.validateLastName(value, context),
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
            validator: (value) => Validators.validatePassword(value, context),
            obscureText: true,
          ),
          SizedBox(height: 10),
          Mytextformfield(
            labelText: 'Confirm password',
            hintText: 'Confirm password',
            // validator: (value) => Validators.validateConfirmPassword(
            //     value, passwordController.text, context),
            obscureText: true,
          ),
          SizedBox(height: 10),
          Mytextformfield(
            labelText: 'Phone number',
            hintText: 'Enter phone number',
            validator: (value) =>
                Validators.validatePhoneNumber(value, context),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),
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

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    AuthCubit authCubit = getIt.get<AuthCubit>();

    return BlocProvider<AuthCubit>(
      create: (context) => authCubit,
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state) {
              case SignUpLoadingState():
                {
                  CustomToast.showLoadingToast(message: "loading");

                  break;
                }
              case SignUpErrorState():
                {
                  print('fail');
                  CustomToast.showErrorToast(
                      message: state.exception.toString());
                  break;
                }
              case SignUpSuccessState():
                {
                  print('success');
                  // CustomToast.showSuccessToast(message: "success");
                  Navigator.pushReplacementNamed(
                      context, RoutesName.forgetPasswordView);

                  break;
                }
              default:
            }
          },
          buildWhen: (previous, current) => current is AuthInitial,
          builder: (context, state) {
            switch (state) {
              case AuthInitial():
              default:
                {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 56, left: 16, right: 16),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 16,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SignUpForm(),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 32,
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: Container(
                          child: Column(
                            children: [
                              SignUpButton(
                                formKey: formKey,
                                authCubit: authCubit,
                                usernameController: usernameController,
                                firstNameController: firstNameController,
                                lastNameController: lastNameController,
                                emailController: emailController,
                                passwordController: passwordController,
                                confirmPasswordController:
                                    confirmPasswordController,
                                phoneNumberController: phoneNumberController,
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
