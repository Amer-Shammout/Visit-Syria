import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomTextFormField extends StatefulWidget {
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
  final String? helperText;

  const CustomTextFormField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.initialValue,
    this.maxLength,
    this.onChanged,
    this.onSaved,
    this.maxLines,
    this.validator, this.helperText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isValid = false;
  Color? color;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });

    if (widget.initialValue != null && widget.validator != null) {
      final errorText = widget.validator!(widget.initialValue);
      _isValid = errorText == null;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }

    if (widget.validator != null) {
      final errorText = widget.validator!(value);
      setState(() {
        _isValid = errorText == null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      cursorErrorColor: AppColors.redSwatch,
      style: AppStyles.fontsRegular16(
        context,
      ).copyWith(color: AppColors.titleTextColor),
      focusNode: _focusNode,
      maxLines: widget.maxLines,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: _handleChanged,
      maxLength: widget.maxLength,
      initialValue: widget.initialValue,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        errorStyle: AppStyles.fontsRegular12(
          context,
        ).copyWith(color: AppColors.redSwatch),
        helperText: widget.helperText,
        helperStyle: AppStyles.fontsRegular12(
          context,
        ).copyWith(color: AppColors.graySwatch[500]),
        hintText: widget.hint,
        hintStyle: AppStyles.fontsRegular16(
          context,
        ).copyWith(color: AppColors.graySwatch[500]),
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: AppColors.graySwatch[50],
        border: buildBorder(Colors.transparent),
        enabledBorder: buildBorder(
          _isValid ? AppColors.primary : Colors.transparent,
        ),
        focusedBorder: buildBorder(
          _isValid ? AppColors.primary : AppColors.primarySwatch[950]!,
        ),
        errorBorder: buildBorder(AppColors.redSwatch[500]!),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color),
    );
  }
}
