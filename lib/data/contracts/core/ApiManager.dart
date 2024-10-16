import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/api/model/request/signupmodel.dart';
import 'package:online_exam_c1_online/data/contracts/core/ApiConstants.dart';
// import 'package:online_exam_c1_online/data/core/UserDto.dart';
import 'package:online_exam_c1_online/data/api/model/response/AuthResponse.dart';
// import 'package:online_exam_c1_online/domain/common/ApiResult.dart';
// import 'package:online_exam_c1_online/domain/common/CustomExceptions.dart';
// import 'package:online_exam_c1_online/domain/model/User.dart';

@lazySingleton
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }

  Future<AuthResponse?> login(String email, String password) async {
    var response = await _dio.post(ApiConstants.signInApi,
        data: {"email": email, "password": password});
    var authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }

  Future<AuthResponse?> signUp(SignUpModel? requestBody,
      {SignUpModel? SignUpModel}) async {
    var response = await _dio.post(ApiConstants.signupApi, data: requestBody);
    var authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }
}
