import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomCounter extends StatelessWidget {
  const CustomCounter({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.size,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int value;
  final int min;
  final int max;
  final double size;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: value > min ? onDecrement : null,
          icon: const Icon(Icons.remove, color: AppColors.whiteColor),
          iconSize: size,
          color: Colors.white,
          style: IconButton.styleFrom(
            foregroundColor: AppColors.whiteColor,
            disabledBackgroundColor: AppColors.primary.withValues(alpha: .5),
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(
          width: size * 1.5,
          child: Center(
            child: Text(
              "$value",
              style: AppStyles.fontsBold18(
                context,
              ).copyWith(color: AppColors.titleTextColor),
            ),
          ),
        ),
        IconButton(
          onPressed: value < max ? onIncrement : null,
          icon: const Icon(Icons.add, color: AppColors.whiteColor),
          iconSize: size,
          color: Colors.white,
          style: IconButton.styleFrom(
            disabledBackgroundColor: AppColors.primary.withValues(alpha: .5),
            foregroundColor: AppColors.whiteColor,

            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
