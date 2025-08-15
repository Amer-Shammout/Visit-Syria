import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/airport_and_flight_details.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/functions/time_and_date_functions.dart';

class GoFlightItem extends StatelessWidget {
  const GoFlightItem({super.key, required this.flightOffer});

  final FlightModel flightOffer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AirportAndFlightDetails(
          airportCode: flightOffer.departureModel!.originAirportCode!,
          airportName: flightOffer.departureModel!.originAirportName!,
          time: convertTo12HourFormat(
            flightOffer.departureModel!.departureTime!,
            arabic: true,
          ),
        ),
        Spacer(),
        Column(
          children: [
            Text(
              "${flightOffer.departureModel!.durationHours!} ساعات",
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
            SvgPicture.asset(Assets.imagesFlightsDir),
            Text(
              "${flightOffer.departureModel!.stops!} محطة توقف",
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
          ],
        ),
        Spacer(),
        AirportAndFlightDetails(
          airportCode: flightOffer.departureModel!.destinationAirportCode!,
          airportName: flightOffer.departureModel!.destinationAirportName!,
          time: convertTo12HourFormat(
            flightOffer.departureModel!.arrivalTime!,
            arabic: true,
          ),
        ),
      ],
    );
  }
}
