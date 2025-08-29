import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/Payment%20Info%20Form/payment_info_form.dart';

class PaymentInfoViewBody extends StatelessWidget {
  const PaymentInfoViewBody({super.key, required this.bookingModel});
  final BookingModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaymentInfoForm(bookingModel: bookingModel),
    );
  }
}
