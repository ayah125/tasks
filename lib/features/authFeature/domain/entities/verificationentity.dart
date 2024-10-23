import 'package:online_exam_c1_online/features/authFeature/data/api/model/request/emailverification.dart';

class EmailVerificationEntity {
  final String? resetCode;

  EmailVerificationEntity({
    required this.resetCode,
  });

  EmailVerificationModel toModel() {
    return EmailVerificationModel(
      resetCode: resetCode,
    );
  }
}
