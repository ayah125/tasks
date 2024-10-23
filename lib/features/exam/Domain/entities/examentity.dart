import 'package:online_exam_c1_online/features/exam/Data/models/requests/exammodel.dart';

class ExamEntity {
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;

  ExamEntity(
      {this.id,
      this.title,
      this.duration,
      this.subject,
      this.numberOfQuestions,
      this.active,
      this.createdAt});

  ExamEntity.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    title = json["title"];
    duration = json["duration"];
    subject = json["subject"];
    numberOfQuestions = json["numberOfQuestions"];
    active = json["active"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["title"] = title;
    _data["duration"] = duration;
    _data["subject"] = subject;
    _data["numberOfQuestions"] = numberOfQuestions;
    _data["active"] = active;
    _data["createdAt"] = createdAt;

    return _data;
  }

  Exam toEntity() {
    return Exam(
        id: id,
        title: title,
        duration: duration,
        subject: subject,
        numberOfQuestions: numberOfQuestions,
        active: active,
        createdAt: createdAt);
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}
