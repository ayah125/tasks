import 'package:injectable/injectable.dart';

import 'package:online_exam_c1_online/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/data/datasource/auth/authdatasource.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/entities/signupentity.dart';
import 'package:online_exam_c1_online/domain/repository/AuthRepository.dart';

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
}
