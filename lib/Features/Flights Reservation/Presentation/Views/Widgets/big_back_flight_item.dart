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
          airportCode: flightOffer.flightModelReturn!.originAirportCode!,
          airportName: flightOffer.flightModelReturn!.originAirportName!,
          time: convertTo12HourFormat(
            flightOffer.flightModelReturn!.departureTime!,
            arabic: true,
          ),
        ),
        Spacer(),
        Column(
          children: [
            Text(
              "${flightOffer.flightModelReturn!.durationHours!} ساعات",
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
            SvgPicture.asset(Assets.imagesFlightsDir, matchTextDirection: true,width: 200,height: 32,),
            Text(
              "${flightOffer.flightModelReturn!.stops!} محطة توقف",
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
          ],
        ),
        Spacer(),
        BigAirportAndFlightDetails(
          airportCode: flightOffer.flightModelReturn!.destinationAirportCode!,
          airportName: flightOffer.flightModelReturn!.destinationAirportName!,
          time: convertTo12HourFormat(
            flightOffer.flightModelReturn!.arrivalTime!,
            arabic: true,
          ),
        ),
      ],
    );
  }
}
