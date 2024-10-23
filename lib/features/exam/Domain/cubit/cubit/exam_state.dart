part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

final class ExamInitial extends ExamState {}

class ExamLoaded extends ExamState {
  final List<Exam> exams;

  ExamLoaded(this.exams);
}
