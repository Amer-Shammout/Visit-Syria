String? getValidMonthValue({
  required String? expYear,
  required String? expMonth,
}) {
  final now = DateTime.now();
  final currentYear = now.year;
  final currentMonth = now.month;

  if (expYear == null) return null;

  final selectedYearInt = int.tryParse(expYear);
  if (selectedYearInt == null) return null;

  if (selectedYearInt == currentYear) {
    // السنة الحالية
    if (expMonth == null) return null; // بالبداية فاضي
    final expMonthInt = int.tryParse(expMonth);
    if (expMonthInt != null && expMonthInt < currentMonth) {
      return null; // ما يرجع شهر قديم
    }
    return expMonth;
  } else if (selectedYearInt > currentYear) {
    // سنة مستقبلية
    return expMonth; // إذا null بيظل فاضي بالبداية
  } else {
    // سنة ماضية (خطأ)
    return null;
  }
}
