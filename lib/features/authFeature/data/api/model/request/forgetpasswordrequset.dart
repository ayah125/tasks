import 'package:online_exam_c1_online/features/authFeature/domain/entities/forgotpasswordentity.dart';

class Forgetpasswordrequset {
  String? email;
  Forgetpasswordrequset({this.email});
  Map<String, dynamic> toJson() => {
        'email': email,
      };
  toEntity() {
    return Forgetpasswordentity(email: email);
  }
}
