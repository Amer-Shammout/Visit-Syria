class AuthRequestModel {
  final String? email;
  final String? password;

  AuthRequestModel({
     this.email,
     this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email!.trim(),
      'password': password,
    };
  }
}
