import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';

class CustomNameFields extends StatelessWidget {
  const CustomNameFields({
    super.key,
    required this.firstNameOnSaved,
    required this.lastNameOnSaved,
    this.firstNameFocus,
    this.secondNameFocus,
  });

  final void Function(String?)? firstNameOnSaved;
  final void Function(String?)? lastNameOnSaved;

  final FocusNode? firstNameFocus;
  final FocusNode? secondNameFocus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFieldWithLabel(
            // textDirection: null,
            hint: 'أحمد',
            label: 'الاسم الأول',
            onSaved: firstNameOnSaved,
            validator: Validation.validateEmptyField,
            focusNode: firstNameFocus,
            textInputAction: TextInputAction.next,
            onEditingComplete:
                () => FocusScope.of(context).requestFocus(secondNameFocus),
          ),
        ),
        const SizedBox(width: AppSpacing.s12),
        Expanded(
          child: CustomTextFieldWithLabel(
            // textDirection: null,
            hint: 'محسن',
            label: 'الاسم الأخير',
            onSaved: lastNameOnSaved,
            validator: Validation.validateEmptyField,
            focusNode: secondNameFocus,
            textInputAction: TextInputAction.done,
            onEditingComplete: () => FocusScope.of(context).unfocus(),
          ),
        ),
      ],
    );
  }
}
