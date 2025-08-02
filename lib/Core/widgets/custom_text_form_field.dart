import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final String? initialValue;
  final int? maxLength;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final String? Function(String?)? validator;
  final String? helperText;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final bool isEnabled;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;
  final bool enableInteractiveSelection;

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
    this.validator,
    this.helperText,
    this.textInputAction,
    this.onEditingComplete,
    this.focusNode,
    this.prefixIcon,
    this.isEnabled = true,
    this.onTap,
    this.controller,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isValid = false;
  late FocusNode _internalFocusNode;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _internalFocusNode;

  @override
  void initState() {
    super.initState();
    _internalFocusNode = FocusNode();
    _effectiveFocusNode.addListener(() {
      setState(() {});
    });

    if (widget.initialValue != null && widget.validator != null) {
      final errorText = widget.validator!(widget.initialValue);
      _isValid = errorText == null;
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
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
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: widget.onTap,
      child: Ink(
        child: TextFormField(
          enableInteractiveSelection: widget.enableInteractiveSelection,
          onTap: widget.onTap,
          controller: widget.controller,
          readOnly: widget.readOnly,
          cursorColor: AppColors.titleTextColor,
          cursorErrorColor: AppColors.redSwatch,
          focusNode: _effectiveFocusNode,
          maxLines: widget.maxLines,
          validator: widget.validator,
          onSaved: widget.onSaved,
          onChanged: _handleChanged,
          maxLength: widget.maxLength,
          initialValue: widget.initialValue,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onEditingComplete: widget.onEditingComplete,
          style: AppStyles.fontsRegular16(context).copyWith(
            color:
                widget.isEnabled
                    ? AppColors.titleTextColor
                    : AppColors.graySwatch,
          ),

          decoration: InputDecoration(
            enabled: widget.isEnabled,
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: BoxConstraints(maxHeight: 32, maxWidth: 32),
            errorStyle: AppStyles.fontsRegular12(
              context,
            ).copyWith(color: AppColors.redSwatch),
            helperText: widget.helperText,
            helperStyle: AppStyles.fontsRegular12(
              context,
            ).copyWith(color: AppColors.graySwatch[500]),
            isDense: true,
            hintText: widget.hint,
            hintStyle: AppStyles.fontsRegular16(
              context,
            ).copyWith(color: AppColors.graySwatch[500]),
            hintMaxLines: 1,
            suffixIcon: widget.suffixIcon,
            filled: true,
            fillColor:
                widget.isEnabled
                    ? AppColors.graySwatch[50]
                    : AppColors.graySwatch[200],
            border: buildBorder(color: Colors.transparent),
            enabledBorder: buildBorder(
              color: _isValid ? AppColors.primary : Colors.transparent,
            ),
            focusedBorder: buildBorder(
              color:
                  _isValid ? AppColors.primary : AppColors.primarySwatch[950]!,
            ),
            errorBorder: buildBorder(color: AppColors.redSwatch[500]!),
            disabledBorder: buildBorder(color: Colors.transparent),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width ?? 1),
    );
  }
}
