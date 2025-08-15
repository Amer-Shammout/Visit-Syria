import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/hotels_and_resturants_details_view_body.dart';

class HotelAndResturantsDetailsView extends StatelessWidget {
  const HotelAndResturantsDetailsView({super.key, this.place});

  final PlaceModel? place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HotelAndResturantsDetailsViewBody(isResturant: true, place: place),
    );
  }
}
