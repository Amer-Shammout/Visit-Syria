import 'package:flutter/material.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Core/constants/flights_reservation_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_search_form.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class FlightsReservationViewBody extends StatefulWidget {
  const FlightsReservationViewBody({super.key});

  @override
  State<FlightsReservationViewBody> createState() =>
      _FlightsReservationViewBodyState();
}

class _FlightsReservationViewBodyState
    extends State<FlightsReservationViewBody> {
  FlightType _selectedType = FlightType.fromSyria;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [
        SliverToBoxAdapter(
          child: TagsListView(
            data: kFlightsReservationTags,
            icons: kFlightsReservationIcons,
            onTagSelected: (value, index) {
              setState(() {
                switch (index) {
                  case 0:
                    _selectedType = FlightType.fromSyria;
                    break;
                  case 1:
                    _selectedType = FlightType.toSyria;
                    break;
                  case 2:
                  default:
                    _selectedType = FlightType.roundTrip;
                }
              });
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),

        SliverToBoxAdapter(child: FlightSearchForm(type: _selectedType)),
      ],
    );
  }
}
