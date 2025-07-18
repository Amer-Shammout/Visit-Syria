import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:visit_syria/Core/constants/gender_constants.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_drop_down_form_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_phone_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';

class SecondaryInfoForm extends StatelessWidget {
  const SecondaryInfoForm({
    super.key,
    this.onGenderChanged,
    this.gender,
    required this.dateController,
    this.onTap,
    this.onPhoneNumberSaved,
  });

  final void Function(String?)? onGenderChanged;
  final String? gender;
  final TextEditingController dateController;
  final void Function()? onTap;
  final void Function(PhoneNumber?)? onPhoneNumberSaved;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: "المعلومات الثانوية",
      hasSeeAll: false,
      section: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDownFormFieldWithLabel<String>(
              label: "الجنس",
              value: gender,
              hint: "ذكر",
              items: kGenderDropdownItems,
              onChanged: onGenderChanged,
            ),
            SizedBox(height: AppSpacing.s16),
            CustomTextFieldWithLabel(
              label: "تاريخ الولادة",
              hint: 'العام / الشهر / اليوم',
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
              readOnly: true,
              onTap: onTap,
              controller: dateController,
            ),
            SizedBox(height: AppSpacing.s16),
            CustomPhoneFieldWithLabel(
              label: "رقم الهاتف",
              hint: "00000000",
              onSaved: onPhoneNumberSaved,
            ),
          ],
        ),
      ),
    );
  }
}
