import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/big_back_flight_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/big_go_flight_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_general_info.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_segements_item.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/MyReservation/custom_my_booking_fab.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/MyReservation/custom_reservation_info_section.dart';

class MyFlightDetailsViewBody extends StatelessWidget {
  const MyFlightDetailsViewBody({super.key, required this.myBookingModel});
  final MyBookingModel myBookingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: false),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.none,

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BigGoFlightItem(flightOffer: myBookingModel.info),
                ),
                myBookingModel.info.isRoundTrip!
                    ? SizedBox(height: AppSpacing.s24)
                    : SizedBox.shrink(),
                myBookingModel.info.isRoundTrip!
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: BigBackFlightItem(
                        flightOffer: myBookingModel.info,
                      ),
                    )
                    : SizedBox.shrink(),
                SizedBox(height: AppSpacing.s24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FlightGeneralInfo(flightModel: myBookingModel.info),
                ),
                SizedBox(height: AppSpacing.s32),
                CustomMyReservationInfoSection(
                  passengers: myBookingModel.bookingInfo!.passengers!,
                  isFlight: true,
                ),
                SizedBox(height: AppSpacing.s24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FlightSegementsItem(
                    segments: myBookingModel.info.departureModel!.segments!,
                  ),
                ),
                myBookingModel.info.returnModel != null
                    ? SizedBox(height: AppSpacing.s32)
                    : SizedBox.shrink(),
                myBookingModel.info.returnModel != null
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: FlightSegementsItem(
                        segments: myBookingModel.info.returnModel!.segments!,
                      ),
                    )
                    : SizedBox.shrink(),

                SizedBox(height: 96),
              ],
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: CustomMyFlightFAB(myBookingModel: myBookingModel),
            ),
          ],
        ),
      ),
    );
  }
}
