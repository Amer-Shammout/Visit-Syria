import 'package:flutter/material.dart';
import 'package:visit_syria/Core/constants/flights_reservation_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/from_syria_form.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/to_and_from_syria_form.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/to_syria_form.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class FlightsReservationViewBody extends StatefulWidget {
  const FlightsReservationViewBody({super.key});

  @override
  State<FlightsReservationViewBody> createState() =>
      _FlightsReservationViewBodyState();
}

class _FlightsReservationViewBodyState
    extends State<FlightsReservationViewBody> {
  Widget selectedForm = FromSyriaForm();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [
        SliverToBoxAdapter(
          child: TagsListView(
            data: kFlightsReservationTags,
            icons: kFlightsReservationIcons,
            onTagSelected:
                (value, index) => setState(() {
                  switch (index) {
                    case 0:
                      selectedForm = FromSyriaForm();
                      break;
                    case 1:
                      selectedForm = ToSyriaForm();
                      break;

                    default:
                      selectedForm = selectedForm = ToAndFromSyriaForm();
                  }
                }),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
        SliverToBoxAdapter(child: selectedForm),
      ],
    );
  }
}
