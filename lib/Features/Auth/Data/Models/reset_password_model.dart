class ResetPasswordModel {
  final String? email;
  final String? code;
  final String? password;

  ResetPasswordModel({this.password, this.email, this.code});

  Map<String, dynamic> toJson() {
    return {
      'email': email!.trim(),
      'code': code,
      'new_password': password,
      'new_password_confirmation': password,
    };
  }
}
