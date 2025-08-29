import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blogs_tags_wrap.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/MyReservation/custom_my_booking_fab.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/MyReservation/custom_reservation_info_section.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_improvements.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_map_with_path.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_time_line.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_general_info.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_header.dart';

class MyTripDetailsViewBody extends StatelessWidget {
  const MyTripDetailsViewBody({super.key, required this.myBookingModel});
  final MyBookingModel myBookingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                CustomSliverAppBar(
                  model: myBookingModel.info,
                  type: 'trip',
                  id: myBookingModel.info.id.toString(),
                  isSaved: myBookingModel.info.isSaved!,
                  images: [
                    Assets.imagesTest,
                    Assets.imagesAzemPalace,
                    Assets.imagesIdlib,
                    Assets.imagesRasafe,
                  ],
                  title:
                      myBookingModel.info.name ??
                      " رحلة في سوريا اوعى تجي او ترجع",
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TripsCardGeneralInfo.tripGeneralInfo(
                      tripModel: myBookingModel.info,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomTourismCompanyRow(
                      company: myBookingModel.info.company,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PostandBlogsTagsWrap(
                      tags: myBookingModel.info.tags ?? ["ششش", "ععع", "ضضض"],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
                SliverToBoxAdapter(
                  child: CustomMyReservationInfoSection(
                    isFlight: false,
                    passengers: myBookingModel.bookingInfo!.passengers!,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
                SliverToBoxAdapter(
                  child: CustomDescription(
                    desc:
                        myBookingModel.info.description ??
                        "انضم إلينا في رحلة لا تُنسى إلى السواحل السورية، حيث تمتد الرمال الذهبية على طول البحر، وتحتضن المدن الساحلية كـ اللاذقية وطرطوس عبق التاريخ وروعة الطبيعة.",
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
                if (myBookingModel.info.improvements != null) ...[
                  SliverToBoxAdapter(
                    child: CustomImprovements(
                      improvements: myBookingModel.info.improvements!,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
                ],

                if (myBookingModel.info.tripPath != null) ...[
                  SliverToBoxAdapter(
                    child: CustomMapWithPath(
                      tripPath: myBookingModel.info.tripPath!,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
                ],

                SliverToBoxAdapter(
                  child: CustomTimeLine(
                    timelines: myBookingModel.info.timelines,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),

                SliverToBoxAdapter(child: SizedBox(height: 96)),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: CustomMyBookingFAB(myBookingModel: myBookingModel),
            ),
          ],
        ),
      ),
    );
  }
}
