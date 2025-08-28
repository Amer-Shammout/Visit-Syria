import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_trip_model/ai_trip_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_time_line.dart';

class AITripDetailsViewBody extends StatelessWidget {
  const AITripDetailsViewBody({super.key, required this.aiTripModel});
  final AiTripModel aiTripModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: LottieBuilder.asset(Assets.lottieAITripeDetails),
          ),
          SliverToBoxAdapter(
            child: CustomSection(
              title: 'العنوان',
              hasSeeAll: false,
              widgets: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    aiTripModel.title!,
                    style: AppStyles.fontsRegular14(
                      context,
                    ).copyWith(color: AppColors.bodyTextColor),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
          SliverToBoxAdapter(
            child: CustomTimeLine(timelines: aiTripModel.timelines),
          ),
          SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s64)),
          SliverToBoxAdapter(
            child:
                aiTripModel.showButton
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomButton(
                        width: double.infinity,
                        onPressed: () {
                          GoRouter.of(
                            context,
                          ).goNamed(AppRouter.kAIHomeTripsName);
                        },
                        title: 'تم',
                        textStyle: AppStyles.fontsBold16(
                          context,
                        ).copyWith(color: AppColors.whiteColor),
                        verPadding: 16,
                        borderRadius: 12,
                        horPadding: 16,
                        icon: Assets.iconsArrow,
                        iconColor: AppColors.whiteColor,
                      ),
                    )
                    : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
