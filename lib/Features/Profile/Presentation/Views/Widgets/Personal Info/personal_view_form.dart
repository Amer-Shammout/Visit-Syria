import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/functions/pick_date.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/profile_avatar_picker.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';
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
  Country? selectedCountry;
  bool? hasError = false;
  // ignore: unused_field
  String? selectedGender;
  final TextEditingController _dateController = TextEditingController();
  String? birthDate;
  String? phoneNum;
  String? firstName, lastName;
  File? userImage;
  Map<String, List<dynamic>>? preferences;
  final GlobalKey<PreferencesFormState> _preferencesWidgetKey =
      GlobalKey<PreferencesFormState>();

  bool validateAndSave() {
    preferences = _preferencesWidgetKey.currentState!.selectedPreferences;
    // log("$birthDate");
    final isValid =
        _formKey.currentState!.validate() &&
        (selectedCountry != null ||
            GetProfileCubit.userModel?.me?.profile?.country != null);
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

  @override
  void initState() {
    if (GetProfileCubit.userModel?.me?.profile?.dateOfBirth != null) {
      _dateController.text =
          GetProfileCubit.userModel?.me?.profile?.dateOfBirth;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _isAutoValidate,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAvatarPicker(
            userImage: GetProfileCubit.userModel?.me?.profile?.photo,
            onImageSelected: (file) => userImage = file,
          ),
          SizedBox(height: AppSpacing.s32),
          PrimaryInfoForm(
            selectedCountry: selectedCountry,
            hasError: hasError!,
            onSelect: (Country country) {
              setState(() {
                hasError = false;
                selectedCountry = country;
              });
            },
            firstNameOnSaved: (val) => firstName = val,
            secondNameOnSaved: (val) => lastName = val,
          ),
          SizedBox(height: AppSpacing.s32),
          SecondaryInfoForm(
            gender:
                GetProfileCubit.userModel?.me?.profile?.gender != "other"
                    ? GetProfileCubit.userModel?.me?.profile?.gender
                    : null,
            onDateSelected:
                (date) => setState(() {
                  birthDate = date;
                }),
            onGenderChanged:
                (gender) => setState(() {
                  selectedGender = gender;
                }),
            dateController: _dateController,
            onTap: () async {
              final birthDate = await pickDate(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                dateFormat: 'yyyy-MM-dd',
              );

              if (birthDate != null) {
                setState(() {
                  _dateController.text = birthDate;
                });
              }
            },
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
