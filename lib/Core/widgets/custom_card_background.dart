import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

class CustomCardBackground extends StatelessWidget {
  const CustomCardBackground({super.key, this.padding = 0, this.child});

  final double padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [Shadows.shadow],
        color: AppColors.whiteColor,
      ),
      child: child,
    );
  }
}
