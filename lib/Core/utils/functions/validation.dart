import 'package:email_validator/email_validator.dart';

abstract class Validation {
  static String? validateEmail(val) {
    if (val == null || val.trim().isEmpty) {
      return 'الرجاء إدخال البريد الإلكتروني';
    } else if (!EmailValidator.validate(val.trim())) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

  static String? validatePasswordSImple(val) {
    if (val == null || val.trim().isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    } else if (val.trim().length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }
    return null;
  }
}
