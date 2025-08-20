import 'dart:developer';

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
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/passangers_view_body.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_info_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_floating_action_button.dart';

class FlightOfferDetailsViewBody extends StatefulWidget {
  const FlightOfferDetailsViewBody({super.key, required this.flightOffer});

  final FlightModel flightOffer;

  @override
  State<FlightOfferDetailsViewBody> createState() =>
      _FlightOfferDetailsViewBodyState();
}

class _FlightOfferDetailsViewBodyState
    extends State<FlightOfferDetailsViewBody> {
  ReservationModel? reservationModel;
  @override
  void initState() {
    super.initState();
    reservationModel = ReservationModel();
    reservationModel!.flightModel = widget.flightOffer;
    reservationModel!.tickets = widget.flightOffer.travelerCount!;
    if (reservationModel!.info == null) {
      reservationModel!.info = [];
      for (var i = 0; i < reservationModel!.tickets!; i++) {
        reservationModel!.info!.add(ReservationInfoModel());
      }
    }
    reservationModel!.passengers = passengers;
    log("${reservationModel!.deletePeople}");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            BigGoFlightItem(flightOffer: widget.flightOffer),
            widget.flightOffer.isRoundTrip!
                ? SizedBox(height: AppSpacing.s24)
                : SizedBox.shrink(),
            widget.flightOffer.isRoundTrip!
                ? BigBackFlightItem(flightOffer: widget.flightOffer)
                : SizedBox.shrink(),
            SizedBox(height: AppSpacing.s24),
            FlightGeneralInfo(flightModel: widget.flightOffer),
            SizedBox(height: AppSpacing.s32),
            FlightSegementsItem(
              segments: widget.flightOffer.departureModel!.segments!,
            ),
            widget.flightOffer.returnModel != null
                ? SizedBox(height: AppSpacing.s32)
                : SizedBox.shrink(),
            widget.flightOffer.returnModel != null
                ? FlightSegementsItem(
                  segments: widget.flightOffer.returnModel!.segments!,
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
            price: widget.flightOffer.priceTotal.toString(),
            onPressed: () {
              GoRouter.of(context).pushNamed(
                AppRouter.kReservationPeopleInoName,
                extra: reservationModel,
              );
            },
          ),
        ),
      ],
    );
  }
}
