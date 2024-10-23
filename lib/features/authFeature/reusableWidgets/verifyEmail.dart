import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_c1_online/di/di.dart';

import 'package:online_exam_c1_online/features/authFeature/presentation/cubit/cubit/auth_cubit.dart';
import 'package:online_exam_c1_online/global/routes/routesname.dart';
import 'package:online_exam_c1_online/features/authFeature/reusableWidgets/customToast.dart';
import 'package:online_exam_c1_online/features/authFeature/reusableWidgets/footer.dart';

class BuildEmailVerificationForm extends StatefulWidget {
  BuildEmailVerificationForm({super.key});

  @override
  State<BuildEmailVerificationForm> createState() =>
      _BuildEmailVerificationFormState();
}

class _BuildEmailVerificationFormState
    extends State<BuildEmailVerificationForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final AuthCubit authViewModel;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    authViewModel = getIt.get<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authViewModel,
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifyEmailError) {
            setState(() {
              hasError = true;
            });
            CustomToast.showErrorToast(message: state.exception.toString());
          } else if (state is VerifyEmailSuccess) {
            setState(() {
              hasError = false;
            });
            CustomToast.showSuccessToast(message: "send successfully");
            Navigator.pushNamed(context, RoutesName.resetPasswordView);
          } else if (state is VerifyEmailLoading) {
            CustomToast.showLoadingToast(message: "loading");
          }
        },
        buildWhen: (previous, current) {
          return current is AuthInitial;
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [],
            ),
          );
        },
      ),
    );
  }
}
