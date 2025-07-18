import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneFieldWithLabel extends StatefulWidget {
  const CustomPhoneFieldWithLabel({
    super.key,
    required this.label,
    required this.hint,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.isEnabled = true,
  });

  final String label;
  final String hint;
  final PhoneNumber? initialValue;
  final TextEditingController? controller;
  final void Function(PhoneNumber)? onChanged;
  final void Function(PhoneNumber?)? onSaved;
  final String? Function(PhoneNumber?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final bool isEnabled;

  @override
  State<CustomPhoneFieldWithLabel> createState() =>
      _CustomPhoneFieldWithLabelState();
}

class _CustomPhoneFieldWithLabelState extends State<CustomPhoneFieldWithLabel> {
  bool _isValid = false;
  String? _errorText;

  void _handleChanged(PhoneNumber value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }

    if (widget.validator != null) {
      final error = widget.validator!(value);
      setState(() {
        _errorText = error;
        _isValid = error == null;
      });
    }
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        const SizedBox(height: AppSpacing.s4),
        Directionality(
          textDirection: TextDirection.ltr,
          child: IntlPhoneField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            initialValue: widget.initialValue?.number,
            enabled: widget.isEnabled,
            showDropdownIcon: true,
            textInputAction: widget.textInputAction,
            onSubmitted: (_) => widget.onEditingComplete?.call(),
            onChanged: _handleChanged,
            onSaved: widget.onSaved,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppStyles.fontsRegular16(
                context,
              ).copyWith(color: AppColors.graySwatch[500]),
              filled: true,
              fillColor:
                  widget.isEnabled
                      ? AppColors.graySwatch[50]
                      : AppColors.graySwatch[200],
              errorText: _errorText,
              errorStyle: AppStyles.fontsRegular12(
                context,
              ).copyWith(color: AppColors.redSwatch),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 12,
              ),
              border: _buildBorder(Colors.transparent),
              enabledBorder: _buildBorder(
                _isValid ? AppColors.primary : Colors.transparent,
              ),
              focusedBorder: _buildBorder(
                _isValid ? AppColors.primary : AppColors.primarySwatch[950]!,
              ),
              errorBorder: _buildBorder(AppColors.redSwatch[500]!),
              focusedErrorBorder: _buildBorder(AppColors.redSwatch[500]!),
              disabledBorder: _buildBorder(Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}
