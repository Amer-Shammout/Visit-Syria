import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/payment_info_view.dart';

class CompletePaymentView extends StatelessWidget {
  const CompletePaymentView({super.key, required this.bookingModel});
  final BookingModel bookingModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'معلومات الدفع'),
      body: PaymentInfoView(bookingModel: bookingModel),
    );
  }
}
