import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/big_airport_and_flight_details.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/functions/time_and_date_functions.dart';

class BigBackFlightItem extends StatelessWidget {
  const BigBackFlightItem({super.key, required this.flightOffer});

  final FlightModel flightOffer;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection:
          Directionality.of(context) == TextDirection.ltr
              ? TextDirection.rtl
              : TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigAirportAndFlightDetails(
          airportCode: flightOffer.returnModel!.originAirportCode!,
          airportName: flightOffer.returnModel!.originAirportName!,
          time: convertTo12HourFormat(
            flightOffer.returnModel!.departureTime!,
            arabic: true,
          ),
        ),
        Spacer(),
        Column(
          children: [
            Text(
              "${flightOffer.returnModel!.durationHours!} ساعات",
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
            SvgPicture.asset(
              Assets.imagesFlightsDir,
              matchTextDirection: true,
              width: 120,
              height: 20,
            ),
            Text(
              "${flightOffer.returnModel!.stops!} محطة توقف",
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
          ],
        ),
        Spacer(),
        BigAirportAndFlightDetails(
          airportCode: flightOffer.returnModel!.destinationAirportCode!,
          airportName: flightOffer.returnModel!.destinationAirportName!,
          time: convertTo12HourFormat(
            flightOffer.returnModel!.arrivalTime!,
            arabic: true,
          ),
        ),
      ],
    );
  }
}
