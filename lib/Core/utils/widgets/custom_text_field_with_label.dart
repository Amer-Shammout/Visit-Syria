import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_text_form_field.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  const CustomTextFieldWithLabel({
    super.key,
    required this.hint,
    required this.label,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.initialValue,
    this.maxLength,
    this.onChanged,
    this.onSaved,
    this.maxLines,
    this.validator,
    this.helperText,
  });
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? initialValue;
  final int? maxLength;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final String? Function(String?)? validator;
  final String label;
  final String? helperText;

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
        SizedBox(height: AppSpacing.s4),
        CustomTextFormField(
          initialValue: initialValue,
          maxLength: maxLength,
          maxLines: maxLines,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          hint: hint,
          keyboardType: keyboardType,
          obscureText: obscureText,
          suffixIcon: suffixIcon,
          helperText: helperText,
        ),
      ],
    );
  }
}
