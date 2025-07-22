class VerificationModel {
  final String? email;
  final String? code;

  VerificationModel({this.email, this.code});

  Map<String, dynamic> toJson() {
    return {'email': email!.trim(), 'code': code};
  }
}
