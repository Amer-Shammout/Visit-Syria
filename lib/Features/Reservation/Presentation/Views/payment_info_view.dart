import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/payment_info_view_body.dart';

class PaymentInfoView extends StatelessWidget {
  const PaymentInfoView({super.key, required this.bookingModel});
  final BookingModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PaymentInfoViewBody(bookingModel: bookingModel)),
    );
  }
}
