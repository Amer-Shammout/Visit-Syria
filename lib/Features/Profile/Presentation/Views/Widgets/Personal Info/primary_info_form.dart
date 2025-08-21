import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_country_picker.dart';
import 'package:visit_syria/Core/widgets/custom_name_fields.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';

class PrimaryInfoForm extends StatelessWidget {
  const PrimaryInfoForm({
    super.key,
    this.firstNameOnSaved,
    this.secondNameOnSaved,
    required this.hasError,
    this.selectedCountry,
    required this.onSelect,
  });

  final void Function(String?)? firstNameOnSaved;
  final void Function(String?)? secondNameOnSaved;
  final bool hasError;
  final Country? selectedCountry;
  final void Function(Country) onSelect;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: "المعلومات الأساسية",
      hasSeeAll: false,
      section: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNameFields(
              firstName: GetProfileCubit.userModel!.me!.profile!.firstName,
              lastName: GetProfileCubit.userModel!.me!.profile!.lastName,
              firstNameOnSaved: firstNameOnSaved,
              lastNameOnSaved: secondNameOnSaved,
            ),
            SizedBox(height: AppSpacing.s16),
            CustomCountryPicker(
              hasError: hasError,
              selectedCountry: selectedCountry,
              onSelect: onSelect,
            ),
            SizedBox(height: AppSpacing.s16),
            CustomTextFieldWithLabel(
              initialValue:
                  GetProfileCubit.userModel!.me!.user!.email ??
                  "amershammout2004@gmail.com",
              label: "البريد الالكتروني",
              hint: "",
              readOnly: true,
              isEnabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
