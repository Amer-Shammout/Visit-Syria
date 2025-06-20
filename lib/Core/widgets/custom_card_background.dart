import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

class CustomCardBackground extends StatelessWidget {
  const CustomCardBackground({
    super.key,
    this.padding = 0,
    this.child,
    this.boxShadow,
    this.hasBottomRadius = true,
  });

  final double padding;
  final Widget? child;
  final BoxShadow? boxShadow;
  final bool hasBottomRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius:
            !hasBottomRadius
                ? BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )
                : BorderRadius.circular(24),
        boxShadow: [boxShadow ?? Shadows.shadow],
        color: AppColors.whiteColor,
      ),
      child: child,
    );
  }
}
