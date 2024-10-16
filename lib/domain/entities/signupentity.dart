import 'package:online_exam_c1_online/data/api/model/request/signupmodel.dart';

class SignUpEntity {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  SignUpEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
      };
  SignUpModel toModel() {
    return SignUpModel(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
  }
}
