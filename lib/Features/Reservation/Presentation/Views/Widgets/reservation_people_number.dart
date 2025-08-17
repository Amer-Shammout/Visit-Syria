import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/custom_counter_statement.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';

class ReservationPeopleNumber extends StatefulWidget {
  const ReservationPeopleNumber({
    super.key,
    required this.maxCounter,

    required this.reservationModel,
  });
  final int? maxCounter;
  final ReservationModel reservationModel;

  @override
  State<ReservationPeopleNumber> createState() =>
      _ReservationPeopleNumberState();
}

class _ReservationPeopleNumberState extends State<ReservationPeopleNumber> {
  @override
  Widget build(BuildContext context) {
    int value = 1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCounterStatement(
          title: "عدد الأشخاص",
          subtitle: null,
          value: value,
          min: 1,
          max: widget.maxCounter,
          size: 20,
          onIncrement: () {
            setState(() {
              value++;
            });
          },
          onDecrement: () {
            setState(() {
              value--;
            });
          },
        ),
        SizedBox(height: AppSpacing.s20),
        Row(
          children: [
            CustomButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(
                  AppRouter.kReservationPeopleInoName,
                  extra: widget.reservationModel.copyWith(tickets: value),
                );
              },
              title: "التالي",
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.whiteColor),
              borderRadius: 16,
              verPadding: 12,
              icon: Assets.iconsArrow,
              iconColor: AppColors.whiteColor,
              size: 16,
            ),
            SizedBox(width: 8),
            CustomButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              title: "تراجع",
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.primary),
              borderRadius: 16,
              verPadding: 12,
              icon: Assets.iconsArrow,
              iconColor: AppColors.primary,
              size: 16,
              fillColor: AppColors.whiteColor,
              strokeColor: AppColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}
