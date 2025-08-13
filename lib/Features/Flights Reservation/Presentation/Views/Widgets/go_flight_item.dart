import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/airport_and_flight_details.dart';

class GoFlightItem extends StatelessWidget {
  const GoFlightItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AirportAndFlightDetails(test: "DAM"),
        Spacer(),
        Column(
          children: [
            Text(
              "3 ساعات",
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
            SvgPicture.asset(Assets.imagesFlightsDir),
            Text(
              "1 محطة توقف",
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
          ],
        ),
        Spacer(),
        AirportAndFlightDetails(),
      ],
    );
  }
}
