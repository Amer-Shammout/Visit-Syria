import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/passenger_count_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/passangers_view_body.dart';

class PassangersView extends StatelessWidget {
  const PassangersView({super.key, required this.passengerCountModel});

    final PassengerCountModel passengerCountModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "المسافرين",),
      body: PassangersViewBody(passengerCountModel: passengerCountModel,),
    );
  }
}