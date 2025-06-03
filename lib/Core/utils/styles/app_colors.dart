import 'package:flutter/material.dart';

class AppColors {
  // اللون الأساسي (450)
  static const Color primary = Color(0xFF1CA686);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF1CA686,
    <int, Color>{
      50: Color(0xFFFBFEFD),
      100: Color(0xFFC2F5E9),
      200: Color(0xFF85EAD3),
      300: Color(0xFF4CE1BE),
      400: Color(0xFF21C49E),
      450: Color(0xFF1CA686), // الأساسي
      500: Color(0xFF17876D),
      600: Color(0xFF136D58),
      700: Color(0xFF0E5343),
      750: Color(0xFF0B4135),
      800: Color(0xFF09342A),
      900: Color(0xFF041A15),
      950: Color(0xFF020D0B),
    },
  );

  // اللون الأحمر الأساسي
  static const Color red = Color(0xFFC02626);

  static const MaterialColor redSwatch = MaterialColor(0xFFC02626, <int, Color>{
    50: Color(0xFFFBEAEA),
    100: Color(0xFFF6D0D0),
    200: Color(0xFFECA1A1),
    300: Color(0xFFE37272),
    400: Color(0xFFDA4444),
    500: Color(0xFFC02626),
    600: Color(0xFF991E1E),
    700: Color(0xFF731717),
    800: Color(0xFF4D0F0F),
    900: Color(0xFF260808),
    950: Color(0xFF150404),
  });

  // اللون الذهبي الأساسي
  static const Color gold = Color(0xFFD1A347);

  static const MaterialColor goldSwatch =
      MaterialColor(0xFFD1A347, <int, Color>{
        50: Color(0xFFFAF5EB),
        100: Color(0xFFF6EDDA),
        200: Color(0xFFEDDAB6),
        300: Color(0xFFE3C891),
        400: Color(0xFFDAB66C),
        500: Color(0xFFD1A347),
        600: Color(0xFFB4872D),
        700: Color(0xFF876522),
        800: Color(0xFF5A4316),
        900: Color(0xFF2D220B),
        950: Color(0xFF140F05),
      });

  // اللون الرمادي الأساسي
  static const Color gray = Color(0xFFB1B9B7);

  static const MaterialColor graySwatch =
      MaterialColor(0xFFB1B9B7, <int, Color>{
        50: Color(0xFFF7F8F8),
        100: Color(0xFFEFF1F0),
        200: Color(0xFFDFE2E1),
        300: Color(0xFFD1D6D5),
        400: Color(0xFFC1C8C6),
        500: Color(0xFFB1B9B7),
        600: Color(0xFF8B9794),
        700: Color(0xFF687471),
        800: Color(0xFF444B49),
        900: Color(0xFF222625),
        950: Color(0xFF111312),
      });

  static const bodyTextColor = Color(0xFF444B49);
  static const titleTextColor = Color(0xFF020D0B);
}
