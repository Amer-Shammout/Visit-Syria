import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/airport_search_result_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/results_airport_search_view_body.dart';

class AirportSearchViewBody extends StatelessWidget {
  const AirportSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CustomTextFormField(
              hint: "البلد أو المدينة أو المطار",
              keyboardType: TextInputType.text,
              onChanged: (p0) {},
              prefixIcon: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 12),
                  child: SvgPicture.asset(
                    Assets.iconsSearch,
                    alignment: Alignment.center,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      AppColors.graySwatch,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ResultsAirportSearchViewBody(
          airports: [
            AirportSearchResultModel(
              city: "New York",
              country: "USA",
              name: "John F. Kennedy International Airport",
              code: "JFK",
            ),
            AirportSearchResultModel(
              city: "London",
              country: "UK",
              name: "London Heathrow Airport",
              code: "LHR",
            ),
            AirportSearchResultModel(
              city: "Paris",
              country: "France",
              name: "Charles de Gaulle Airport",
              code: "CDG",
            ),
            AirportSearchResultModel(
              city: "New York",
              country: "USA",
              name: "LaGuardia Airport",
              code: "LGA",
            ),
          ],
        ),
      ],
    );
  }
}
