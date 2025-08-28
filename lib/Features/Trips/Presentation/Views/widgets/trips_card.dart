import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blogs_tags_wrap.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/home_cubit/home_cubit.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_general_info.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_header.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_image.dart';

class TripsCard extends StatelessWidget {
  const TripsCard({super.key, required this.tripModel});
  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripsCardImage(
            action:  () => BlocProvider.of<HomeCubit>(
                                  context,
                                ).fetchHomeData(),
            id: tripModel.id.toString(),
            imageHeight: 200,
            positionedVal: 12,
            discount: tripModel.discount!,
            title: tripModel.name,
            isSaved: tripModel.isSaved ?? false,
            model: tripModel,
          ),
          SizedBox(height: AppSpacing.s16),
          CustomTourismCompanyRow(company: tripModel.company),
          SizedBox(height: AppSpacing.s16),
          Text(
            tripModel.description ??
                "انضم إلينا في رحلة لا تُنسى إلى السواحل السورية، حيث تمتد الرمال الذهبية على طول البحر، وتحتضن المدن الساحلية كـ اللاذقية وطرطوس عبق التاريخ وروعة الطبيعة.",
            style: AppStyles.fontsRegular14(
              context,
            ).copyWith(color: AppColors.bodyTextColor),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppSpacing.s16),
          PostandBlogsTagsWrap(tags: tripModel.tags ?? ["ششش", "ععع", "ضضض"]),
          SizedBox(height: AppSpacing.s16),
          TripsCardGeneralInfo.tripGeneralInfo(tripModel: tripModel),
          SizedBox(height: AppSpacing.s16),
          CustomButton(
            onPressed: () {
              GoRouter.of(
                context,
              ).pushNamed(AppRouter.kTripDetailsName, extra: tripModel);
            },
            title: "استكشاف",
            textStyle: AppStyles.fontsBold14(
              context,
            ).copyWith(color: AppColors.whiteColor),
            borderRadius: 16,
            verPadding: 8,
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            size: 16,
          ),
        ],
      ),
    );
  }
}
