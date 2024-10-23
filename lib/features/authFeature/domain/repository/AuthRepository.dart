import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/forgetpasswordresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/forgotpasswordentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/signupentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/verificationentity.dart';

abstract class AuthRepository {
  // Future<Result<User?>> login(String email, String password);
  Future<Result<SignUpResponse>> signUp({required SignUpEntity signUpEntity});
  Future<Result<ForgetPasswordResponse>> forgetpassword(
      {required Forgetpasswordentity Forgetpasswordentity});
  Future<Result<EmailVerificationResponse>> verifyEmail(
      {required EmailVerificationEntity emailVerificationEntity});
}
