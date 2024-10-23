import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/forgetpasswordrequset.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/signupmodel.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/emailverification.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/forgetpasswordresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/features/authFeature/data/contracts/core/ApiManager.dart';
import 'package:online_exam_c1_online/features/authFeature/data/datasource/auth/authdatasource.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/common/ApiResult.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;
  AuthDataSourceImpl(this.apiManager);
  Future<Result<SignUpResponse>> signUp(
      {required SignUpModel signUpModel}) async {
    var response = await apiManager.signUp(signUpModel: signUpModel);
    return response;
  }

  @override
  Future<Result<ForgetPasswordResponse>> forgetPassword(
      {required Forgetpasswordrequset forgetPassword}) async {
    var response =
        await apiManager.forgetpassword(forgetpasswordmodel: forgetPassword);
    return response;
  }

  @override
  Future<Result<EmailVerificationResponse>> verifyEmail(
      {required EmailVerificationModel emailVerificationModel}) async {
    var response = await apiManager.verifyEmail(
        emailVerificationModel: emailVerificationModel);
    return response;
  }
}
