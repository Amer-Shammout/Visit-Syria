import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:intl_phone_field/phone_number.dart';

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

  static String? validatePasswordComplex(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }

    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 محارف على الأقل';
    }

    final hasUppercase = value.contains(RegExp(r'[A-Z]'));
    final hasLowercase = value.contains(RegExp(r'[a-z]'));
    final hasDigit = value.contains(RegExp(r'\d'));
    final hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase) {
      return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
    }

    if (!hasLowercase) {
      return 'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل';
    }

    if (!hasDigit) {
      return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
    }

    if (!hasSpecialChar) {
      return 'كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل';
    }

    return null; // valid
  }

  static String? validateConfirmPassword(
    String? confirmPassword,
    String? originalPassword,
  ) {
    if (confirmPassword == null || confirmPassword.trim().isEmpty) {
      return 'الرجاء تأكيد كلمة المرور';
    }

    if (confirmPassword != originalPassword) {
      return 'كلمة المرور غير متطابقة';
    }

    return null; // valid
  }

  static String? validateEmptyPINField(String? value) {
    if (value == null || value.trim().isEmpty || value.length < 4) {
      return '';
    }

    return null; // valid
  }

  static String? validateEmptyField(val) =>
      val == null || val.isEmpty ? 'مطلوب' : null;

  static String? validateEmptyPhone(val) {
    if (val == null) {
      return 'مطلوب';
    }

    PhoneNumber phoneNumber = val;

    log(phoneNumber.toString());
    if (phoneNumber.number == '') {
      return 'مطلوب';
    }
    return null;
  }

  static String? validateAdultAge(String? date) {
    if (date == null) {
      return null;
    }
    DateTime adultAge = DateTime.parse(date);
    if (DateTime.now().year - adultAge.year < 18) {
      return 'يجب أن يكون العمر 18 عام على الأقل';
    }
    return null;
  }

  static String? validatChildAge(String? date) {
    if (date == null) {
      return null;
    }
    DateTime childAge = DateTime.parse(date);
    if (DateTime.now().year - childAge.year < 2 ||
        DateTime.now().year - childAge.year > 17) {
      return 'يجب أن يكون العمر بين 2 و 17 عام';
    }
    return null;
  }

  static String? validateInfantAge(String? date) {
    if (date == null) {
      return null;
    }
    DateTime childAge = DateTime.parse(date);
    if (DateTime.now().year - childAge.year > 2) {
      return 'يجب أن يكون العمر 2 عام على الأقل';
    }
    return null;
  }

  static String? validatePersonAge(String? date) {
    if (date == null) {
      return null;
    }
    DateTime childAge = DateTime.parse(date);
    if (DateTime.now().year - childAge.year < 2) {
      return 'يجب أن يكون العمر 2 عام على الأقل';
    }
    return null;
  }

  static String? validatePassportNumber(String? value) {
    if (value == null) return 'الرجاء إدخال رقم الجواز';
    final s = value.trim().toUpperCase();
    // اسمح فقط بحروف A-Z وأرقام 0-9، طول بين 6 و 9
    final re = RegExp(r'^[A-Z0-9]{6,9}$');
    if (!re.hasMatch(s)) {
      return 'رقم الجواز يجب أن يكون 6–9 محارف من A–Z أو 0–9 بدون مسافات أو رموز';
    }
    return null; // صالح
  }
}
