import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:visit_syria/Core/constants/gender_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_date_picker_field.dart';
import 'package:visit_syria/Core/widgets/custom_drop_down_form_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_phone_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';

class SecondaryInfoForm extends StatelessWidget {
  const SecondaryInfoForm({
    super.key,
    this.onGenderChanged,
    this.gender,
    required this.dateController,
    this.onTap,
    this.onPhoneNumberSaved,
    this.onDateSelected,
  });

  final void Function(String?)? onGenderChanged;
  final String? gender;
  final TextEditingController dateController;
  final void Function()? onTap;
  final void Function(PhoneNumber?)? onPhoneNumberSaved;
  final void Function(String)? onDateSelected;

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
              hint: "اختر الجنس",
              items: kGenderDropdownItems,
              onChanged: onGenderChanged,
            ),
            SizedBox(height: AppSpacing.s16),
            CustomDatePickerField(
              controller: dateController,
              hint: 'العام / الشهر / اليوم',
              label: "تاريخ الولادة",
              onDateSelected: onDateSelected,
              dateFormat: 'yyyy-MM-dd',
            ),
            SizedBox(height: AppSpacing.s16),
            CustomPhoneFieldWithLabel(
              initialCountyCode:
                  GetProfileCubit.userModel!.me!.profile!.countryCode,
              initialValue:
                  GetProfileCubit.userModel != null
                      ? PhoneNumber(
                        countryISOCode:
                            GetProfileCubit.userModel!.me!.profile!.countryCode,
                        countryCode:
                            GetProfileCubit.userModel!.me!.profile!.countryCode,
                        number: GetProfileCubit.userModel!.me!.profile!.phone,
                      )
                      : null,
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
