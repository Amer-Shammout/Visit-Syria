import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/reservation_people_info_consumer.dart';

class ReservationPeopleInfoView extends StatelessWidget {
  const ReservationPeopleInfoView({super.key, required this.reservationModel});
  final ReservationModel reservationModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'معلومات الحجز'),
      body: ReservationPeopleInfoConsumer(reservationModel: reservationModel),
    );
  }
}
