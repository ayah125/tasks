import 'package:dio/dio.dart';
import 'package:online_exam_c1_online/features/exam/Data/models/requests/exammodel.dart';

class ExamWebService {
  late Dio dio;

  ExamWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://exam.elevateegy.com/api/v1/",
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<List<Exam>> getAllExams() async {
    try {
      Response response = await dio.get('exams');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
