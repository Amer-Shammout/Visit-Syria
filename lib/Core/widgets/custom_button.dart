import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

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
    this.icon,
    this.size = 16,
    this.iconColor = AppColors.primary,
    this.shadow = Shadows.buttonShadow1,
  });

  final VoidCallback onPressed;
  final String title;
  final TextStyle textStyle;
  final double verPadding, horPadding;
  final double? width;
  final double borderRadius;
  final Color fillColor;
  final Color strokeColor;
  final String? icon;
  final double size;
  final Color iconColor;
  final BoxShadow? shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: shadow != null ? [shadow!] : []),
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(0, 0),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: textStyle),
            icon != null ? SizedBox(width: AppSpacing.s4) : SizedBox.shrink(),
            icon != null
                ? SvgPicture.asset(
                  icon!,
                  width: size,
                  height: size,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcATop),
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
