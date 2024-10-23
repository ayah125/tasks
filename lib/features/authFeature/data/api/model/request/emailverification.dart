import 'package:online_exam_c1_online/features/authFeature/domain/entities/verificationentity.dart';

class EmailVerificationModel {
  String? resetCode;

  EmailVerificationModel({
    this.resetCode,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resetCode'] = resetCode;
    return map;
  }

  EmailVerificationEntity toEntity() {
    return EmailVerificationEntity(
      resetCode: resetCode,
    );
  }
}
