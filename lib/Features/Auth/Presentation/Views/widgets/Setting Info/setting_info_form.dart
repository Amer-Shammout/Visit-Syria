import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_country_picker.dart';
import 'package:visit_syria/Core/widgets/custom_name_fields.dart';
import 'package:visit_syria/Core/widgets/profile_avatar_picker.dart';
import 'package:visit_syria/Features/Auth/Data/Models/profile_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/set_profile_cubit/set_profile_cubit.dart';

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
  final _firstNameFocus = FocusNode();
  final _secondNameFocus = FocusNode();

  void _submit() async {
    if (_formKey.currentState!.validate() && _selectedCountry != null) {
      _formKey.currentState!.save();
      log(
        "First Name : $firstName  Last Name : $lastName  Selected Country : ${_selectedCountry?.name}  File : ${userImage?.path}",
      );
      MultipartFile? multipartFile;
      if (userImage != null) {
        multipartFile = await MultipartFile.fromFile(
          userImage!.path,
          filename: userImage!.path.split('/').last,
        );
      }

      log("${multipartFile?.filename}");

      ProfileModel profileModel = ProfileModel(
        firstName: firstName,
        lastName: lastName,
        country: "${_selectedCountry?.flagEmoji} ${_selectedCountry?.name}",
        countryCode: "+${_selectedCountry?.phoneCode}",
        uploadPhoto: multipartFile,
      );
      await BlocProvider.of<SetProfileCubit>(context).setProfile(profileModel);
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
        hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _firstNameFocus.dispose();
    _secondNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _isAutoValidate,
      key: _formKey,
      child: Column(
        children: [
          ProfileAvatarPicker(onImageSelected: (file) => userImage = file),
          const SizedBox(height: AppSpacing.s24),
          CustomNameFields(
            firstNameFocus: _firstNameFocus,
            secondNameFocus: _secondNameFocus,
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
