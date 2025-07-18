import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/profile_avatar_picker.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Personal%20Info/preferences_form.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Personal%20Info/primary_info_form.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Personal%20Info/secondary_info_form.dart';

class PersonalViewForm extends StatefulWidget {
  const PersonalViewForm({super.key});

  @override
  State<PersonalViewForm> createState() => PersonalViewFormState();
}

class PersonalViewFormState extends State<PersonalViewForm> {
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Country? _selectedCountry;
  bool? hasError = false;
  // ignore: unused_field
  String? _gender;
  final TextEditingController _dateController = TextEditingController();
  String? birthDate;
  String? phoneNum;
  String? firstName, lastName;
  Map<String, List<String>>? preferences;
  final GlobalKey<PreferencesFormState> _preferencesWidgetKey =
      GlobalKey<PreferencesFormState>();

  bool validateAndSave() {
    preferences = _preferencesWidgetKey.currentState!.selectedPreferences;
    log("$preferences");
    final isValid =
        _formKey.currentState!.validate() && _selectedCountry != null;
    if (isValid) {
      _formKey.currentState!.save();
      return true;
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
        hasError = true;
      });
      return false;
    }
  }

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('ar'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.whiteColor,
              onSurface: AppColors.titleTextColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      birthDate = DateFormat('yyyy / MM / dd').format(picked);
      setState(() => _dateController.text = birthDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _isAutoValidate,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAvatarPicker(userImage: Assets.imagesHama),
          SizedBox(height: AppSpacing.s32),
          PrimaryInfoForm(
            selectedCountry: _selectedCountry,
            hasError: hasError!,
            onSelect: (Country country) {
              setState(() {
                hasError = false;
                _selectedCountry = country;
              });
            },
            firstNameOnSaved: (val) => firstName = val,
            secondNameOnSaved: (val) => lastName = val,
          ),
          SizedBox(height: AppSpacing.s32),
          SecondaryInfoForm(
            onGenderChanged:
                (gender) => setState(() {
                  _gender = gender;
                }),
            dateController: _dateController,
            onTap: _pickDate,
            onPhoneNumberSaved: (phoneNumber) {
              phoneNum = phoneNumber?.completeNumber;
            },
          ),
          SizedBox(height: AppSpacing.s32),
          PreferencesForm(key: _preferencesWidgetKey),
        ],
      ),
    );
  }
}
