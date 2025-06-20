import 'package:flutter/material.dart';

abstract class Shadows {
  static const BoxShadow shadow = BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 5,
    color: Color.fromARGB(20, 0, 0, 0),
  );
  static const BoxShadow commonShadow = BoxShadow(
    offset: Offset(0, 8),
    blurRadius: 8,
    color: Color.fromARGB(20, 0, 0, 0),
  );
  static const BoxShadow buttonShadow1 = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 10,
    color: Color.fromARGB(25, 0, 0, 0),
  );
  static const BoxShadow buttonShadow2 = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 5,
    color: Color.fromARGB(35, 0, 0, 0),
  );

  static const BoxShadow weatherCardShadow = BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 4,
    color: Color.fromARGB(50, 28, 166, 134),
  );
  static const BoxShadow paymentMethodCardShadow = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 10,
    color: Color.fromARGB(30, 28, 166, 134),
  );
  static const BoxShadow aiBootContainerShadow = BoxShadow(
    offset: Offset(0, -8),
    blurRadius: 15,
    color: Color.fromARGB(50, 0, 0, 0),
  );
  static const BoxShadow secondaryBarShadow = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 8,
    color: Color.fromARGB(20, 0, 0, 0),
  );
}
