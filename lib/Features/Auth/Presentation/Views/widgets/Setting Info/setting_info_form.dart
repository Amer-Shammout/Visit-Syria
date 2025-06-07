import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_button.dart';
import 'package:visit_syria/Core/utils/widgets/custom_country_picker.dart';
import 'package:visit_syria/Core/utils/widgets/custom_name_fields.dart';
import 'package:visit_syria/Core/utils/widgets/profile_avatar.dart';

class SettingInfoForm extends StatefulWidget {
  const SettingInfoForm({super.key});

  @override
  State<SettingInfoForm> createState() => _SettingInfoFormState();
}

class _SettingInfoFormState extends State<SettingInfoForm> {
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  Country? _selectedCountry;
  File? userImage;
  bool? hasError = false;

  void _submit() {
    if (_formKey.currentState!.validate() && _selectedCountry != null) {
      _formKey.currentState!.save();
      log(
        "First Name : $firstName  Last Name : $lastName  Selected Country : ${_selectedCountry?.displayName}  File : ${userImage?.path}",
      );
      GoRouter.of(context).pushReplacementNamed(AppRouter.kPreferencesName);
      // TODO: send data to API
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _isAutoValidate,
      key: _formKey,
      child: Column(
        children: [
          ProfileAvatar(onImageSelected: (file) => userImage = file),
          const SizedBox(height: AppSpacing.s24),
          CustomNameFields(
            firstNameOnSaved: (val) => firstName = val,
            lastNameOnSaved: (val) => lastName = val,
          ),
          const SizedBox(height: AppSpacing.s16),
          CustomCountryPicker(
            hasError: hasError!,
            selectedCountry: _selectedCountry,
            onSelect: (Country country) {
              setState(() {
                hasError = false;
                _selectedCountry = country;
              });
            },
          ),
          const SizedBox(height: AppSpacing.s32),
          CustomButton(
            onPressed: _submit,
            title: 'التالي',
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            textStyle: AppStyles.fontsBold16(
              context,
            ).copyWith(color: AppColors.whiteColor),
            width: double.infinity,
            verPadding: 16,
            borderRadius: 16,
          ),
        ],
      ),
    );
  }
}
