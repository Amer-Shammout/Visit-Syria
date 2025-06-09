import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_text_field_with_label.dart';

class CustomNameFields extends StatelessWidget {
  const CustomNameFields({
    super.key,
    required this.firstNameOnSaved,
    required this.lastNameOnSaved,
  });

  final void Function(String?)? firstNameOnSaved;
  final void Function(String?)? lastNameOnSaved;

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
          ),
        ),
      ],
    );
  }
}
