import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/keyboard_unfocus_in_hide.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/reservation_people_info_consumer.dart';

class ReservationPeopleInfoView extends StatelessWidget {
  const ReservationPeopleInfoView({super.key, required this.reservationModel});
  final ReservationModel reservationModel;
  @override
  Widget build(BuildContext context) {
    return KeyboardUnfocusOnHide(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ReservationPeopleInfoConsumer(
          reservationModel: reservationModel,
        ),
      ),
    );
  }
}
