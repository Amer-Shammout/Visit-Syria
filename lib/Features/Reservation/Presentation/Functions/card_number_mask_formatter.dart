import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  String _realText = "";

  // الرقم الحقيقي بدون أي تعديل
  String get realText => _realText;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // إزالة أي حرف غير رقم
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // الحد الأقصى للرقم: 16
    if (digitsOnly.length > 16) digitsOnly = digitsOnly.substring(0, 16);

    _realText = digitsOnly;

    // إضافة مسافة كل 4 أرقام
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if ((i + 1) % 4 == 0 && i + 1 != digitsOnly.length) buffer.write(' ');
    }
    String masked = buffer.toString();

    // إعادة موقع الكرسر
    int cursorPosition = masked.length;
    return TextEditingValue(
      text: masked,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
