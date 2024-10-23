import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_exam_c1_online/features/authFeature/presentation/screens/forgetpasswordScreen.dart';
import 'package:online_exam_c1_online/features/authFeature/presentation/screens/resetpassword.dart';

import 'package:online_exam_c1_online/features/exam/presentation/screens/examsScreen.dart';
import 'package:online_exam_c1_online/global/routes/routesname.dart';
import 'package:online_exam_c1_online/features/authFeature/presentation/screens/signupScreen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RoutesName.signupScreen: (context) => SignUpView(),
      RoutesName.forgetPasswordView: (context) => Forgetpasswordscreen(),
      RoutesName.resetPasswordView: (context) => ResetPasswordScreen(),
      RoutesName.examsscreen: (context) => Examsscreen(),
    };
  }
}
