import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/forgetpasswordresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/forgotpasswordentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/signupentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/entities/verificationentity.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/repository/AuthRepository.dart';

@Injectable()
class AuthUsecase {
  final AuthRepository authRepo;
  @FactoryMethod()
  AuthUsecase({required this.authRepo});

  Future<Result<SignUpResponse>> signUp(
      {required SignUpEntity signUpEntity}) async {
    return await authRepo.signUp(signUpEntity: signUpEntity);
  }

  Future<Result<ForgetPasswordResponse>> fogetpassword(
      {required Forgetpasswordentity Forgetpasswordentity}) async {
    return await authRepo.forgetpassword(
        Forgetpasswordentity: Forgetpasswordentity);
  }

  Future<Result<EmailVerificationResponse>> verifyEmail(
      {required EmailVerificationEntity emailVerificationEntity}) async {
    return await authRepo.verifyEmail(
        emailVerificationEntity: emailVerificationEntity);
  }
}
