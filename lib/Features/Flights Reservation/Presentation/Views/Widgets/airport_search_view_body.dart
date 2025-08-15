import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Manager/search_airports_cubit/search_airports_cubit.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/airport_search_view_body_builder.dart';

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
              onFieldSubmitted: (keyword) {
                BlocProvider.of<SearchAirportsCubit>(
                  context,
                ).fetchAirports(keyword);
              },
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
        AirportsSearchViewBodyBuilder(),
      ],
    );
  }
}
