import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/entities/signupentity.dart';
import 'package:online_exam_c1_online/domain/repository/AuthRepository.dart';

@Injectable()
class AuthUsecase {
  final AuthRepository authRepo;
  @FactoryMethod()
  AuthUsecase({required this.authRepo});

  Future<Result<SignUpResponse>> signUp(
      {required SignUpEntity signUpEntity}) async {
    return await authRepo.signUp(signUpEntity: signUpEntity);
  }
}
