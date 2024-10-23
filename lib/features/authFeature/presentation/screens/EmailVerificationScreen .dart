import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:online_exam_c1_online/di/di.dart';
import 'package:online_exam_c1_online/features/authFeature/presentation/cubit/cubit/auth_cubit.dart';
import 'package:online_exam_c1_online/global/routes/routesname.dart';
import 'package:online_exam_c1_online/global/styles/colors.dart';
import 'package:online_exam_c1_online/features/authFeature/reusableWidgets/customToast.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final AuthCubit authCubit;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    authCubit = getIt.get<AuthCubit>();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    // This is where you can call your domain use case to verify the code
    final code = _codeController.text;
    if (code.length == 4) {
      print("Verifying Code: $code");
      // Call your domain's use case to verify the code
    } else {
      print("Please enter a valid code");
    }
  }

  void _resendCode() {
    // This is where you can call the domain layer to resend the code
    print("Resending Code");
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = Color.fromARGB(255, 18, 46, 120);
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (context) => authCubit,
        child: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is VerifyEmailError) {
            setState(() {
              hasError = true;
            });
            CustomToast.showErrorToast(message: state.exception.toString());
          } else if (state is VerifyEmailSuccess) {
            setState(() {
              hasError = false;
            });
            CustomToast.showSuccessToast(message: "success");
            Navigator.pushNamed(context, RoutesName.resetPasswordView);
          } else if (state is VerifyEmailLoading) {
            CustomToast.showLoadingToast(message: "error");
          }
        }, buildWhen: (previous, current) {
          return current is AuthInitial;
        }, builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Email verification',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please enter your code that was sent to your email address',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  OtpTextField(
                    numberOfFields: 5,
                    borderColor: colors.blueBaseColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      CustomToast.showErrorToast(message: 'error');
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RoutesName.resetPasswordView);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: color1),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: _resendCode,
                    child: Text(
                      "Didn't receive code? Resend",
                      style: TextStyle(color: color1),
                    ),
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
