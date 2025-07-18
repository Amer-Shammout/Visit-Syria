import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget? prefixIcon;
  final bool isEnabled;

  const CustomDropdownFormField({
    super.key,
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      dropdownColor: AppColors.graySwatch[50],
      elevation: 1,
      value: value,
      items: items,
      onChanged: isEnabled ? onChanged : null,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.graySwatch[50],
        hintText: hint,
        hintStyle: AppStyles.fontsRegular16(
          context,
        ).copyWith(color: AppColors.graySwatch[500]),
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 32,
          maxWidth: 32,
        ),
        border: _buildBorder(Colors.transparent),
        enabledBorder: _buildBorder(Colors.transparent),
        focusedBorder: _buildBorder(AppColors.primarySwatch[950]!),
        errorBorder: _buildBorder(AppColors.redSwatch[500]!),
        disabledBorder: _buildBorder(Colors.transparent),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      style: AppStyles.fontsRegular16(
        context,
      ).copyWith(color: AppColors.titleTextColor),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}
