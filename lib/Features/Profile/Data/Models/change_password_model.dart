class ChangePasswordModel {
  final String currentPassword, newPassword, confirmNewPassword;

  const ChangePasswordModel({required this.currentPassword, required this.newPassword, required this.confirmNewPassword});

  Map<String, dynamic> toJson() {
    return {
      'old_password': currentPassword,
      'new_password': newPassword,
      'new_password_confirmation': confirmNewPassword,
    };
  }
}
