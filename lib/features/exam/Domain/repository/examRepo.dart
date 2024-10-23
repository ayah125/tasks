import 'package:online_exam_c1_online/features/exam/Data/models/requests/exammodel.dart';
import 'package:online_exam_c1_online/features/exam/Data/webServices/webServices.dart';


class Examrepo {

final ExamWebService examWebService;
Examrepo({required this.examWebService});

  Future<List<Exam>> getallexams() async {
    final exams = await examWebService.getAllExams();
    return exams.map((exam) => Exam.fromJson(exam as Map<String, dynamic>)).toList();
  }

}