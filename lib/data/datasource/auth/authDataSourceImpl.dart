// import 'package:injectable/injectable.dart';
// import 'package:online_exam_c1_online/data/api/model/request/signupmodel.dart';
// import 'package:online_exam_c1_online/data/api/model/response/signupresponse.dart';
// import 'package:online_exam_c1_online/data/core/ApiManager.dart';
// import 'package:online_exam_c1_online/data/datasource/auth/authdatasource.dart';
// import 'package:online_exam_c1_online/domain/common/ApiResult.dart';

// @Injectable(as: AuthDataSource)

// class AuthDataSourceImpl implements AuthDataSource {
//   ApiManager apiManager;
//   AuthDataSourceImpl(this.apiManager);
// @override

//   Future<Result<SignUpResponse>> signUp({required SignUpModel signUpModel}) async{
//     var response = await apiManager.signUp(SignUpModel: signUpModel);
//     return response;
//   }



// }