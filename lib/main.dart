import 'package:flutter/material.dart';
import 'package:online_exam_c1_online/di/di.dart';
import 'package:online_exam_c1_online/global/routes/appRoutes.dart';
import 'package:online_exam_c1_online/global/routes/routesname.dart';

void main() {
  configureDependencies();
  runApp(exam());
}

class exam extends StatelessWidget {
  exam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.examsscreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
