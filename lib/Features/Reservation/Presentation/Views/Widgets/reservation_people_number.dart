import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/custom_counter_statement.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_info_model.dart';
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
  int value = 1;
  @override
  void initState() {
    super.initState();

    widget.reservationModel.difference = 0;
    widget.reservationModel.deletePeople = false;
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: CustomButton(
                onPressed: () {
                  if (widget.reservationModel.tickets != null &&
                      value < widget.reservationModel.tickets!) {
                    widget.reservationModel.deletePeople = true;
                    widget.reservationModel.difference =
                        widget.reservationModel.tickets! - value;
                  } else {
                    widget.reservationModel.tickets = value;
                  }
                  if (widget.reservationModel.info == null) {
                    widget.reservationModel.info = [];
                    for (var i = 0; i < widget.reservationModel.tickets!; i++) {
                      widget.reservationModel.info!.add(ReservationInfoModel());
                    }
                  } else {
                    if (widget.reservationModel.info!.length <
                        widget.reservationModel.tickets!) {
                      int add =
                          widget.reservationModel.tickets! -
                          widget.reservationModel.info!.length;
                      for (var i = 0; i < add; i++) {
                        widget.reservationModel.info!.add(
                          ReservationInfoModel(),
                        );
                      }
                    }
                    for (
                      var i = 0;
                      i < widget.reservationModel.info!.length;
                      i++
                    ) {
                      log("$i is ${widget.reservationModel.info![i]}");
                    }
                  }

                  GoRouter.of(context).pushNamed(
                    AppRouter.kReservationPeopleInoName,
                    extra: widget.reservationModel,
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
            ),
            SizedBox(width: 8),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                title: "تراجع",
                textStyle: AppStyles.fontsBold14(
                  context,
                ).copyWith(color: AppColors.primary),
                borderRadius: 16,
                verPadding: 12,

                iconColor: AppColors.primary,
                size: 16,
                fillColor: AppColors.whiteColor,
                strokeColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
