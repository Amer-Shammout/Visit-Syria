class AuthRequestModel {
  final String? email;
  final String? password;

  AuthRequestModel({this.email, this.password});

  Map<String, dynamic> toJsonRegister() {
    return {
      'email': email!.trim(),
      'password': password,
      'password_confirmation': password,
    };
  }
  Map<String, dynamic> toJsonLogin() {
    return {
      'email': email!.trim(),
      'password': password,
    };
  }
}
