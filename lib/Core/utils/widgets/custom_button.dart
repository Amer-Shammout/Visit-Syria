import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.textStyle,
    this.verPadding = 16,
    this.width,
    this.borderRadius = 24,
    this.horPadding = 16,
    this.fillColor = AppColors.primary,
    this.strokeColor = Colors.transparent,
  });

  final VoidCallback onPressed;
  final String title;
  final TextStyle textStyle;
  final double verPadding, horPadding;
  final double? width;
  final double borderRadius;
  final Color fillColor;
  final Color strokeColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: fillColor,
          padding: EdgeInsets.symmetric(
            vertical: verPadding,
            horizontal: horPadding,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: strokeColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(title, style: textStyle),
      ),
    );
  }
}
