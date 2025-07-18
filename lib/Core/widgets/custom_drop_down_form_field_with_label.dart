import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_drop_down_form_field.dart';

class CustomDropDownFormFieldWithLabel<T> extends StatelessWidget {
  const CustomDropDownFormFieldWithLabel({
    super.key,
    required this.hint,
    this.value,
    required this.items,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.isEnabled = true,
    required this.label,
  });
  final String hint;
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget? prefixIcon;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        const SizedBox(height: AppSpacing.s4),
        CustomDropdownFormField<T>(
          hint: hint,
          items: items,
          isEnabled: isEnabled,
          onChanged: onChanged,
          prefixIcon: prefixIcon,
          validator: validator,
          value: value,
        ),
      ],
    );
  }
}
