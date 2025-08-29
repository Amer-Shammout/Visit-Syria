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
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_general_info.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_header.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_image.dart';

class MyTripCard extends StatelessWidget {
  const MyTripCard({super.key, required this.myBookingModel});
  final MyBookingModel myBookingModel;
  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripsCardImage(
            action: () => BlocProvider.of<HomeCubit>(context).fetchHomeData(),
            id: myBookingModel.info.id.toString(),
            imageHeight: 200,
            positionedVal: 12,
            discount: myBookingModel.info.discount!,
            title: myBookingModel.info.name,
            isSaved: myBookingModel.info.isSaved ?? false,
            model: myBookingModel.info,
          ),
          SizedBox(height: AppSpacing.s16),
          CustomTourismCompanyRow(company: myBookingModel.info.company),
          SizedBox(height: AppSpacing.s16),
          Text(
            myBookingModel.info.description ??
                "انضم إلينا في رحلة لا تُنسى إلى السواحل السورية، حيث تمتد الرمال الذهبية على طول البحر، وتحتضن المدن الساحلية كـ اللاذقية وطرطوس عبق التاريخ وروعة الطبيعة.",
            style: AppStyles.fontsRegular14(
              context,
            ).copyWith(color: AppColors.bodyTextColor),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppSpacing.s16),
          PostandBlogsTagsWrap(
            tags: myBookingModel.info.tags ?? ["ششش", "ععع", "ضضض"],
          ),
          SizedBox(height: AppSpacing.s16),
          TripsCardGeneralInfo.tripGeneralInfo(tripModel: myBookingModel.info),
          SizedBox(height: AppSpacing.s16),
          CustomButton(
            onPressed: () {
              GoRouter.of(
                context,
              ).pushNamed(AppRouter.kMyTripDetailsName, extra: myBookingModel);
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
