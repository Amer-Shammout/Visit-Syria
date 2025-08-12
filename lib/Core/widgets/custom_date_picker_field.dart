import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/pick_date.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';

class CustomDatePickerField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String dateFormat;
  final ValueChanged<String>? onDateSelected;
  final String? Function(String?)? validator;
  final String? initialValue;

  const CustomDatePickerField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateFormat = 'yyyy / MM / dd',
    this.onDateSelected,
    this.validator, this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWithLabel(
    initialValue: initialValue,
      maxLines: 1,
      validator: validator,
      label: label,
      hint: hint,
      readOnly: true,
      controller: controller,
      suffixIcon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(
          Assets.iconsDate,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            AppColors.graySwatch,
            BlendMode.srcATop,
          ),
        ),
      ),
      onTap: () async {
        final date = await pickDate(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(1900),
          lastDate: lastDate ?? DateTime.now(),
          dateFormat: dateFormat,
        );

        if (date != null) {
          controller.text = date;
          if (onDateSelected != null) {
            onDateSelected!(date);
          }
        }
      },
    );
  }
}
