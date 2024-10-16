import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/api/apiExtenstions.dart';
import 'package:online_exam_c1_online/data/api/model/request/signupmodel.dart';
import 'package:online_exam_c1_online/data/contracts/core/ApiManager.dart';
import 'package:online_exam_c1_online/data/contracts/core/UserDto.dart';
import 'package:online_exam_c1_online/data/contracts/auth/AuthOnlineDataSource.dart';
import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';

@Injectable(as: AuthOnlineDatasource)
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource {
  ApiManager apiManager;

  AuthOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<User?>> login(String email, String password) async {
    return executeApi<User>(
      () async {
        var authResponse = await apiManager.login(email, password);
        var userDto = UserDto(token: authResponse?.token);
        return userDto.toUser();
      },
    );
  }

  @override
  Future<Result<User?>> signUp(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) async {
    var body = SignUpModel(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    return executeApi<User>(
      () async {
        var response = await apiManager.signUp(body);
        var userDto = UserDto(token: response?.token);
        return userDto.toUser();
      },
    );
  }
}
