import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/forgetpasswordrequset.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/signupmodel.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/forgetpasswordresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/contracts/core/ApiConstants.dart';

import 'package:online_exam_c1_online/features/authFeature/data/contracts/core/apierrors.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/common/ApiResult.dart';

@lazySingleton
class ApiManager {
  late Dio _dio;

  ApiManager() : _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)) {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      logPrint: (object) {
        print('api :: $object');
      },
    ));
  }

  Future<Result<SignUpResponse>> signUp(
      {required SignUpModel signUpModel}) async {
    return apiExecution<SignUpResponse>(
      request: _dio.post<dynamic>(
        "${ApiConstants.signupApi}",
        data: signUpModel.toJson(),
      ),
      fromJson: (data) => SignUpResponse.fromJson(data),
    );
  }

  Future<Result<ForgetPasswordResponse>> forgetpassword(
      {required Forgetpasswordrequset forgetpasswordmodel}) async {
    return apiExecution<ForgetPasswordResponse>(
        request: _dio.post<dynamic>("  ${ApiConstants.forgetpasswordApi} ",
            data: forgetpasswordmodel.toJson()),
        fromJson: (data) => ForgetPasswordResponse.fromJson(data));
  }

  Future<Result<EmailVerificationResponse>> verifyEmail(
      {required EmailVerificationModel emailVerificationModel}) async {
    return apiExecution<EmailVerificationResponse>(
      request: _dio.post<dynamic>(
        ApiConstants.verifyEmail,
        data: emailVerificationModel.toJson(),
      ),
      fromJson: (data) => EmailVerificationResponse.fromJson(data),
    );
  }
}
