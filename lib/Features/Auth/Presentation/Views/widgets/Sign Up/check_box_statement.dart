import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class CheckBoxStatement extends StatelessWidget {
  const CheckBoxStatement({
    super.key,
    required this.isError,
    required this.isCheck,
    required this.satement,
    this.onChanged,
  });

  final bool isError;
  final bool isCheck;
  final void Function(bool?)? onChanged;
  final String satement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.primary,
          isError: isError,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          value: isCheck,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

          onChanged: onChanged,
        ),
        SizedBox(width: AppSpacing.s0),
        Text(
          satement,
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.graySwatch[800]),
        ),
      ],
    );
  }
}
