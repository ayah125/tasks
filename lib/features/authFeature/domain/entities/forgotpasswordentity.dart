import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/forgetpasswordrequset.dart';

class Forgetpasswordentity {
  String? email;
  Forgetpasswordentity({this.email});

  toModel() {
    return Forgetpasswordrequset(email: email);
  }
}
