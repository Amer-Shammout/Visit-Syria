import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';

class CustomCompanyLogo extends StatelessWidget {
  const CustomCompanyLogo({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(360),
      child: Image.asset(
        Assets.imagesBurgerImage,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}