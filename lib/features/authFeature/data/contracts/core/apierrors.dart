import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/common/ApiResult.dart';
import 'package:online_exam_c1_online/features/authFeature/domain/exceptions/exceptions.dart';

Future<Result<T>> apiExecution<T>({
  required Future<Response<dynamic>> request,
  required T Function(dynamic data) fromJson,
}) async {
  try {
    Response<dynamic> response = await request;
    return Success(fromJson(response.data));
  } on SocketException {
    return Fail(exception: NoInternetException());
  } on TimeoutException {
    return Fail(exception: NoInternetException());
  } on DioException catch (e) {
    if (e.response?.statusCode == 400) {
      return Fail(
          exception: BadRequestException(message: e.response?.data['message']));
    } else if (e.response?.statusCode == 401) {
      return Fail(
          exception:
              UnauthorizedException(message: e.response?.data['message']));
    } else if (e.response?.statusCode == 404) {
      return Fail(exception: NotFound(message: e.response?.data['message']));
    } else if (e.response?.statusCode == 409) {
      return Fail(
          exception: ConflictException(message: e.response?.data['message']));
    } else if (e.response != null && e.response!.statusCode! >= 500) {
      return Fail(exception: ServerError(details: e.response!.data.toString()));
    } else {
      return Fail(exception: ParsingError());
    }
  } catch (e) {
    return Fail(exception: UnknownErrorException());
  }
}
