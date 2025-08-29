import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_map.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/widgets/event_general_info.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/MyReservation/custom_my_booking_fab.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/MyReservation/custom_reservation_info_section.dart';

class MyEventDetailsViewBody extends StatelessWidget {
  const MyEventDetailsViewBody({super.key, required this.myBookingModel});
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
                  type: 'event',
                  model: myBookingModel.info,
                  id: myBookingModel.info.id.toString(),
                  isSaved: myBookingModel.info.isSaved,
                  images: [
                    Assets.imagesTest,
                    Assets.imagesAzemPalace,
                    Assets.imagesIdlib,
                    Assets.imagesRasafe,
                  ],
                  title: myBookingModel.info.name ?? "",
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
                SliverToBoxAdapter(
                  child: EventGenerlInfo(event: myBookingModel.info),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
                SliverToBoxAdapter(
                  child: CustomMyReservationInfoSection(
                    passengers: myBookingModel.bookingInfo!.passengers!,
                    isFlight: false,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
                SliverToBoxAdapter(
                  child: CustomDescription(
                    desc: myBookingModel.info.description ?? "",
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
                SliverToBoxAdapter(
                  child: CustomMap(
                    latitude: double.parse(myBookingModel.info.latitude!),
                    longitude: double.parse(myBookingModel.info.longitude!),
                  ),
                ),
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
