import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trip_details_view_body.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key, required this.tripModel});
  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TripDetailsViewBody(tripModel: tripModel));
  }
}
