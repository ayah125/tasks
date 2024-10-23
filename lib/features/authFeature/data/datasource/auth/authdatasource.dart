import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/forgetpasswordrequset.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/signupmodel.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/forgetpasswordresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/common/ApiResult.dart';

abstract class AuthDataSource {
  Future<Result<SignUpResponse>> signUp({required SignUpModel signUpModel});
  Future<Result<ForgetPasswordResponse>> forgetPassword(
      {required Forgetpasswordrequset forgetPassword});
  Future<Result<EmailVerificationResponse>> verifyEmail(
      {required EmailVerificationModel emailVerificationModel});
}
