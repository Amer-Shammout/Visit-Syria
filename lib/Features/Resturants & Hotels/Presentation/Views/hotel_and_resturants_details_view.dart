import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/hotels_and_resturants_details_view_body.dart';

class HotelAndResturantsDetailsView extends StatelessWidget {
  const HotelAndResturantsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HotelAndResturantsDetailsViewBody(isResturant: true));
  }
}
