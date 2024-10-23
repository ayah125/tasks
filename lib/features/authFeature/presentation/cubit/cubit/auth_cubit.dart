import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/forgetpasswordresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/forgotpasswordentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/signupentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/exceptions/exceptions.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/usecase/authusecase.dart';

part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  AuthUsecase authUsecase;

  @FactoryMethod()
  AuthCubit(this.authUsecase) : super(AuthInitial());

  void signUp(SignUpEntity signUpEntity, BuildContext context) async {
    emit(SignUpLoadingState());
    var result = await authUsecase.signUp(signUpEntity: signUpEntity);
    switch (result) {
      case Success<SignUpResponse>():
        {
          emit(SignUpSuccessState(signUpResponse: result.data));
          break;
        }

      case Fail<SignUpResponse>():
        {
          final exception = result.exception;
          if (exception is ConflictException) {
            emit(SignUpErrorState(exception: exception.message));
          } else if (exception is NoInternetException) {
            emit(SignUpErrorState(exception: exception.message));
          } else if (exception is ServerError) {
            emit(SignUpErrorState(exception: exception.message));
          } else {
            emit(SignUpErrorState(exception: "An unknown error occurred"));
          }
          break;
        }
    }
  }

  void forgetPassword(
      Forgetpasswordentity forgetPasswordEntity, BuildContext context) async {
    emit(ForgetPasswordLoading());

    var result = await authUsecase.fogetpassword(
        Forgetpasswordentity: forgetPasswordEntity);

    switch (result) {
      case Success<ForgetPasswordResponse>():
        {
          emit(ForgetPasswordSuccess(forgetPasswordResponse: result.data!));
          break;
        }

      case Fail<ForgetPasswordResponse>():
        {
          final exception = result.exception;
          if (exception is NotFound) {
            emit(ForgetPasswordError(exception: ""));
          } else if (exception is NoInternetException) {
            emit(ForgetPasswordError(exception: ""));
          } else if (exception is ServerError) {
            emit(ForgetPasswordError(exception: ""));
          } else {
            emit(ForgetPasswordError(exception: ""));
          }
          break;
        }
    }
  }
}
