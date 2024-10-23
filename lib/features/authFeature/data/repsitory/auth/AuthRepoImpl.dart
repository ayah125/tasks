import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/forgetpasswordresponse.dart';

import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/datasource/auth/authdatasource.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/forgotpasswordentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/signupentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/verificationentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/repository/AuthRepository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource authDataSource;

  @factoryMethod
  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Result<SignUpResponse>> signUp(
      {required SignUpEntity signUpEntity}) async {
    return await authDataSource.signUp(signUpModel: signUpEntity.toModel());
  }

  @override
  Future<Result<ForgetPasswordResponse>> forgetpassword(
      {required Forgetpasswordentity Forgetpasswordentity}) async {
    return await authDataSource.forgetPassword(
        forgetPassword: Forgetpasswordentity.toModel());
  }

  @override
  Future<Result<EmailVerificationResponse>> verifyEmail(
      {required EmailVerificationEntity emailVerificationEntity}) async {
    return await authDataSource.verifyEmail(
        emailVerificationModel: emailVerificationEntity.toModel());
  }
}
