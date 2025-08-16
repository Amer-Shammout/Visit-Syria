import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/payment_info_view_body.dart';

class PaymentInfoView extends StatelessWidget {
  const PaymentInfoView({super.key, required this.reservationModel});
  final ReservationModel reservationModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaymentInfoViewBody(reservationModel: reservationModel),
    );
  }
}
