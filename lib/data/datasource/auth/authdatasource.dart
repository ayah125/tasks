import 'package:online_exam_c1_online/data/api/model/request/signupmodel.dart';
import 'package:online_exam_c1_online/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';

abstract class AuthDataSource {
  Future<Result<SignUpResponse>> signUp({required SignUpModel signUpModel});
}
