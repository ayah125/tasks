class Exam {
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  String? createdAt;

  Exam(
      {this.id,
      this.title,
      this.duration,
      this.subject,
      this.numberOfQuestions,
      this.active,
      this.createdAt});

  Exam.fromJson(Map<String, dynamic> json) {
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
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}
