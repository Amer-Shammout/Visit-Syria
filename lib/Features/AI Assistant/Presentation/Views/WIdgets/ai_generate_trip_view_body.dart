import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/ai_prefferences_constant.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_prefferences_model.dart';
import 'package:visit_syria/Features/AI%20Assistant/Presentation/Managers/generate_ai_trip_cubit/generate_ai_trip_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Preferences/preferences_section.dart';

class AIGenerateTripViewBody extends StatefulWidget {
  const AIGenerateTripViewBody({super.key});

  @override
  State<AIGenerateTripViewBody> createState() => _AIGenerateTripViewBodyState();
}

class _AIGenerateTripViewBodyState extends State<AIGenerateTripViewBody> {
  final AiPrefferencesModel aiPrefferencesModel = AiPrefferencesModel(
    averageActivity: [],
    cities: [],
    duration: [],
    sleepingInHotel: [],
    travelWith: [],
    typeOfPlaces: [],
    typeOfTrips: [],
  );

  void toggleSelection(String key, String option) {
    setState(() {
      log(aiPrefferencesModel.toString());
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
    return BlocListener<GenerateAiTripCubit, GenerateAiTripState>(
      listener: (context, state) {
        if (state is GenerateAiTripSuccess) {
          GoRouter.of(
            context,
          ).goNamed(AppRouter.kAITripDetailsName, extra: state.aiTripModel);
        }
        if (state is GenerateAiTripFailure) {
          GoRouter.of(context).pop();
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is GenerateAiTripLoading) {
          GoRouter.of(context).pushNamed(AppRouter.kAILoadingName);
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'يرجى الإجابة على جميع الأسئلة لضمان تصميم رحلة سياحية مخصصة ومناسبة لتفضيلاتك بدقة.',
                  style: AppStyles.fontsRegular16(
                    context,
                  ).copyWith(color: AppColors.bodyTextColor),
                ),
                const SizedBox(height: AppSpacing.s32),
                ...kAISections.map(
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
                  onPressed: () async {
                    await BlocProvider.of<GenerateAiTripCubit>(
                      context,
                    ).generateTrip(aiPrefferencesModel);
                  },
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
      ),
    );
  }

  setList(key) {
    if (key == 'TripTypes') {
      return aiPrefferencesModel.typeOfTrips;
    } else if (key == 'TripDuration') {
      return aiPrefferencesModel.duration;
    } else if (key == 'ActivityLevel') {
      return aiPrefferencesModel.averageActivity;
    } else if (key == 'TravelPerson') {
      return aiPrefferencesModel.travelWith;
    } else if (key == 'PlacesType') {
      return aiPrefferencesModel.typeOfPlaces;
    } else if (key == 'SleepInHotel') {
      return aiPrefferencesModel.sleepingInHotel;
    } else {
      return aiPrefferencesModel.cities;
    }
  }
}
