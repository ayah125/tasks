import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_c1_online/features/exam/Data/models/requests/exammodel.dart';
import 'package:online_exam_c1_online/features/exam/Domain/repository/examRepo.dart';
import 'package:online_exam_c1_online/main.dart';

part 'exam_state.dart';

// class ExamCubit extends Cubit<ExamState> {
//   // ExamCubit() : super(ExamInitial());
// }

class ExamCubit extends Cubit<ExamState> {
  final Examrepo examrepo;
  List<Exam> exam = [];

  ExamCubit(this.examrepo) : super(ExamInitial());

  List<Exam> getAllExams() {
    examrepo.getallexams().then((exam) {
      emit(ExamLoaded(exam));
      this.exam = exam;
    });

    return exam;
  }
}
