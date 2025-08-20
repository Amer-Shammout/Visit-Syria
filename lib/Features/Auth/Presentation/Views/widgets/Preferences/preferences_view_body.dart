import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/preferences_constants.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/Auth/Data/Models/preferences_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/set_preferences_cubit/set_preferences_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/auth_views_header.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Preferences/preferences_section.dart';

class PreferencesViewBody extends StatefulWidget {
  const PreferencesViewBody({super.key});

  @override
  State<PreferencesViewBody> createState() => _PreferencesViewBodyState();
}

class _PreferencesViewBodyState extends State<PreferencesViewBody> {
  final PreferencesModel preferencesModel = PreferencesModel(
    preferredSeason: [],
    preferredActivities: [],
    duration: [],
    cities: [],
  );

  void _submit() {
    log("$preferencesModel");
    BlocProvider.of<SetPreferencesCubit>(
      context,
    ).setPreferences(preferencesModel);
    // TODO: send to backend or move to next step
  }

  void toggleSelection(String key, String option) {
    setState(() {
      log("$preferencesModel");
      final list = setList(key);
      if (list.contains(option)) {
        list.remove(option);
      } else {
        list.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.s32),
              const AuthViewsHeader(
                canPop: true,
                title: 'اختر تفضيلاتك السياحية',
                subTitle:
                    'ساعدنا على فهم اهتماماتك لتقديم محتوى، وجهات، وتجارب مخصصة لك',
              ),
              const SizedBox(height: AppSpacing.s32),
              ...kSections.map(
                (section) => Column(
                  children: [
                    PreferencesSection(
                      title: section.title,
                      options: section.options,
                      selectedOptions: setList(section.key) ?? [],
                      onOptionToggle:
                          (val) => toggleSelection(section.key, val),
                    ),
                    const SizedBox(height: AppSpacing.s32),
                  ],
                ),
              ),
              CustomButton(
                onPressed: _submit,
                title: 'تأكيد',
                icon: Assets.iconsArrow,
                iconColor: AppColors.whiteColor,
                textStyle: AppStyles.fontsBold16(
                  context,
                ).copyWith(color: AppColors.whiteColor),
                width: double.infinity,
                verPadding: 16,
                borderRadius: 16,
              ),
              const SizedBox(height: AppSpacing.s32),
            ],
          ),
        ),
      ),
    );
  }

  setList(key) {
    if (key == 'seasons') {
      return preferencesModel.preferredSeason;
    } else if (key == 'types') {
      return preferencesModel.preferredActivities;
    } else if (key == 'governorates') {
      return preferencesModel.cities;
    } else {
      return preferencesModel.duration;
    }
  }
}
