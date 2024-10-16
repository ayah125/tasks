import 'package:online_exam_c1_online/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/entities/signupentity.dart';

abstract class AuthRepository {
  // Future<Result<User?>> login(String email, String password);
  Future<Result<SignUpResponse>> signUp({required SignUpEntity signUpEntity});
}
