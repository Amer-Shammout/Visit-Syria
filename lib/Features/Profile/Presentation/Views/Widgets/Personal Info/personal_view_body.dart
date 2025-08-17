import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_general_floating_button.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Profile/Data/Models/update_profile_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Personal%20Info/personal_view_form.dart';

class PersonalViewBody extends StatefulWidget {
  const PersonalViewBody({super.key});

  @override
  State<PersonalViewBody> createState() => _PersonalViewBodyState();
}

class _PersonalViewBodyState extends State<PersonalViewBody> {
  final GlobalKey<PersonalViewFormState> _formWidgetKey =
      GlobalKey<PersonalViewFormState>();
  void _handleSubmit() async {
    final formState = _formWidgetKey.currentState!;
    if (formState.validateAndSave()) {
      MultipartFile? multipartFile;
      if (formState.userImage != null) {
        multipartFile = await MultipartFile.fromFile(
          formState.userImage!.path,
          filename: formState.userImage!.path.split('/').last,
        );
      }
      final UpdateProfileModel newProfile = UpdateProfileModel(
        cities: formState.preferences?['governorates'],
        country:
            "${formState.selectedCountry?.flagEmoji} ${formState.selectedCountry?.name}",
        countryCode: "+${formState.selectedCountry?.phoneCode}",
        dateOfBirth: formState.birthDate,
        duration: formState.preferences?['durations'],
        firstName: formState.firstName,
        lastName: formState.lastName,
        gender: formState.selectedGender,
        phone: formState.phoneNum,
        preferredActivities: formState.preferences?["types"],
        preferredSeason: formState.preferences?['seasons'],
        uploadPhoto: multipartFile,
      );
      log("token ${Prefs.getString(kToken)} \n $newProfile");
      await BlocProvider.of<UpdateProfileCubit>(
        context,
      ).updateProfile(newProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess && context.mounted) {
          showSuccessSnackBar("تم تعديل الملف الشخصي بنجاح", context);
        }
        if (state is UpdateProfileFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is UpdateProfileLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(child: CustomLoadingIndicator()),
          );
        } else {
          GoRouter.of(context).pop();
        }
      },
      child: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: PersonalViewForm(key: _formWidgetKey),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: CustomGeneralFloatingButton(
                onPressed: _handleSubmit,
                title: "تعديل",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
