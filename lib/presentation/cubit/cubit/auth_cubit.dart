import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_c1_online/data/api/model/response/signupresponse.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/entities/signupentity.dart';
import 'package:online_exam_c1_online/domain/exceptions/exceptions.dart';
import 'package:online_exam_c1_online/domain/usecase/authusecase.dart';

part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  AuthUsecase? authUsecase;

  @FactoryMethod()
  AuthCubit(this.authUsecase) : super(AuthInitial());

  void signUp(SignUpEntity signUpEntity) async {
    emit(SignUpLoadingState());
    var result = await authUsecase!.signUp(signUpEntity: signUpEntity);
    switch (result) {
      case Success<SignUpResponse>():
        {
          emit(SignUpSuccessState(signUpResponse: result.data));
          break;
        }

      case Fail<SignUpResponse>():
        {
          final exception = result.exception;
          if (exception is ConflictException) {
            emit(SignUpErrorState(exception: exception.message));
          } else if (exception is NoInternetException) {
            emit(SignUpErrorState(exception: exception.message));
          } else if (exception is ServerError) {
            emit(SignUpErrorState(exception: exception.message));
          } else {
            emit(SignUpErrorState(exception: "An unknown error occurred"));
          }
          break;
        }
    }
  }
}
