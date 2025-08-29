import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hint;
  final Widget? hintWidget; // Animated hint
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
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatter;
  const CustomTextFormField({
    super.key,
    this.hint,
    this.hintWidget,
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
    this.onFieldSubmitted,
    this.inputFormatter,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isValid = false;
  late FocusNode _internalFocusNode;
  late TextEditingController _internalController;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _internalFocusNode;
  TextEditingController get _effectiveController =>
      widget.controller ?? _internalController;

  bool get _isFieldEmpty =>
      _effectiveController.text.isEmpty &&
      (widget.initialValue?.isEmpty ?? true);

  @override
  void initState() {
    super.initState();
    _internalFocusNode = FocusNode();
    _internalController = TextEditingController(text: widget.initialValue);

    _effectiveFocusNode.addListener(() {
      setState(() {});
    });

    _effectiveController.addListener(() {
      setState(() {}); // لتحديث ظهور hintWidget
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
    if (widget.controller == null) {
      _internalController.dispose();
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
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        TextFormField(
          inputFormatters: widget.inputFormatter,
          controller: _effectiveController,
          onFieldSubmitted: widget.onFieldSubmitted,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          cursorColor: AppColors.titleTextColor,
          cursorErrorColor: AppColors.redSwatch,
          focusNode: _effectiveFocusNode,
          maxLines: widget.maxLines ?? 1,
          validator: widget.validator,
          onSaved: widget.onSaved,
          onChanged: _handleChanged,
          maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onEditingComplete: widget.onEditingComplete,
          style: AppStyles.fontsRegular16(
            context,
          ).copyWith(color: AppColors.titleTextColor),
          decoration: InputDecoration(
            enabled: widget.isEnabled,
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 32,
              maxWidth: 32,
            ),
            errorStyle: AppStyles.fontsRegular12(
              context,
            ).copyWith(color: AppColors.redSwatch),
            helperText: widget.helperText,
            helperStyle: AppStyles.fontsRegular12(
              context,
            ).copyWith(color: AppColors.graySwatch[500]),
            isDense: true,
            hintText: widget.hintWidget == null ? widget.hint : null,
            hintStyle: AppStyles.fontsRegular16(
              context,
            ).copyWith(color: AppColors.graySwatch[500]),
            suffixIcon: widget.suffixIcon,
            filled: true,
            fillColor: widget.isEnabled ? Colors.grey[100] : Colors.grey[200],
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
        if (widget.hintWidget != null && _isFieldEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: IgnorePointer(child: widget.hintWidget!),
          ),
      ],
    );
  }

  OutlineInputBorder buildBorder({required Color color, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width ?? 1),
    );
  }
}
