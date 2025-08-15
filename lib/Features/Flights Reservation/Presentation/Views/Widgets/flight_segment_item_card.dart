import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/segment.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/flight_segment_item_card_header.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/functions/time_and_date_functions.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/section.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_time_line_tile.dart';

class FlightSegementsItemCard extends StatelessWidget {
  const FlightSegementsItemCard({super.key, required this.segment});

  final Segment segment;

  @override
  Widget build(BuildContext context) {
    final departureTime = extractDateAndTime(segment.departureTime!);
    final arrivalTime = extractDateAndTime(segment.arrivalTime!);
    return CustomCardBackground(
      padding: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlightSegementsItemCardHeader(segment: segment),
          SizedBox(height: AppSpacing.s16),
          Column(
            children: [
              CustomTimeLineTile(
                isFirst: true,
                isLast: false,
                timeline: Section(
                  title: segment.originAirportName!,
                  time: departureTime['time'],
                ),
                isFormated: true,
              ),
              CustomTimeLineTile(
                isFirst: false,
                isLast: true,
                timeline: Section(
                  title: segment.destinationAirportName!,
                  time: arrivalTime['time'],
                ),
                isFormated: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
