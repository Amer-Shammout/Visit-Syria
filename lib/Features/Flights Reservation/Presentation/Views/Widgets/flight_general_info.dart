import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';

class FlightGeneralInfo extends StatelessWidget {
  const FlightGeneralInfo({super.key, required this.flightModel});

  final FlightModel flightModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GeneralInfoItem(icon: Assets.iconsRank, title: 'اقتصادي'),
        GeneralInfoItem(
          icon: Assets.iconsPrice,
          title: "${flightModel.pricePerPassenger}\$",
        ),
        GeneralInfoItem(
          icon: Assets.iconsTicket,
          title: "${flightModel.seatsRemaining} تذاكر متبقية",
        ),
      ],
    );
  }
}
