import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/data/Enums/enum.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/big_back_flight_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/big_go_flight_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_general_info.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_segements_item.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_floating_action_button.dart';

class FlightOfferDetailsViewBody extends StatelessWidget {
  const FlightOfferDetailsViewBody({super.key, required this.flightOffer});

  final FlightModel flightOffer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            BigGoFlightItem(flightOffer: flightOffer),
            flightOffer.isRoundTrip!
                ? SizedBox(height: AppSpacing.s24)
                : SizedBox.shrink(),
            flightOffer.isRoundTrip!
                ? BigBackFlightItem(flightOffer: flightOffer)
                : SizedBox.shrink(),
            SizedBox(height: AppSpacing.s24),
            FlightGeneralInfo(flightModel: flightOffer),
            SizedBox(height: AppSpacing.s32),
            FlightSegementsItem(
              segments: flightOffer.departureModel!.segments!,
            ),
            flightOffer.returnModel != null
                ? SizedBox(height: AppSpacing.s32)
                : SizedBox.shrink(),
            flightOffer.returnModel != null
                ? FlightSegementsItem(
                  segments: flightOffer.returnModel!.segments!,
                )
                : SizedBox.shrink(),
            SizedBox(height: AppSpacing.s24),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: CustomFloatingActionButton(
            type: PriceStateEnum.common,
            price: flightOffer.priceTotal.toString(),
            onPressed: () {
              GoRouter.of(context).pushNamed(
                AppRouter.kReservationPeopleInoName,
                extra: ReservationModel(flightModel: flightOffer),
              );
            },
          ),
        ),
      ],
    );
  }
}
