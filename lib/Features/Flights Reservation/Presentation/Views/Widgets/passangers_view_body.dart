import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/passenger_constants.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/passenger_count_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/custom_counter_statement.dart';

class PassangersViewBody extends StatefulWidget {
  const PassangersViewBody({super.key, required this.passengerCountModel});

  final PassengerCountModel passengerCountModel;

  @override
  State<PassangersViewBody> createState() => _PassangersViewBodyState();
}

class _PassangersViewBodyState extends State<PassangersViewBody> {
  late PassengerCountModel _passengerCountModel;

  @override
  void initState() {
    _passengerCountModel = widget.passengerCountModel;
    passengers.adults = 0;
    passengers.children = 0;
    passengers.infants = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomCounterStatement(
            title: "بالغون",
            subtitle: "18 عاماً أو أكثر",
            min: minAdults,
            max: maxAdults,
            onDecrement: () {
              setState(() {
                _passengerCountModel.adults--;
              });
            },
            onIncrement: () {
              setState(() {
                _passengerCountModel.adults++;
              });
            },
            size: 20,
            value: _passengerCountModel.adults,
          ),
          SizedBox(height: AppSpacing.s24),
          Divider(color: AppColors.graySwatch[300]),
          SizedBox(height: AppSpacing.s24),
          CustomCounterStatement(
            title: "أطفال",
            subtitle: "من 2 إلى 17 عاماً",
            min: minChildren,
            max: maxChildren,
            onDecrement: () {
              setState(() {
                _passengerCountModel.children--;
                log("$_passengerCountModel");
              });
            },
            onIncrement: () {
              setState(() {
                _passengerCountModel.children++;
                log("${_passengerCountModel.children}");
              });
            },
            size: 20,
            value: _passengerCountModel.children,
          ),
          SizedBox(height: AppSpacing.s24),
          Divider(color: AppColors.graySwatch[300]),
          SizedBox(height: AppSpacing.s24),
          CustomCounterStatement(
            title: "رضع",
            subtitle: "أقل من 2 عام",
            min: minInfants,
            max: maxInfants,
            onDecrement: () {
              setState(() {
                _passengerCountModel.infants--;
              });
            },
            onIncrement: () {
              setState(() {
                _passengerCountModel.infants++;
              });
            },
            size: 20,
            value: _passengerCountModel.infants,
          ),
          SizedBox(height: AppSpacing.s24),
          Divider(color: AppColors.graySwatch[300]),
          SizedBox(height: AppSpacing.s32),
          Text(
            "• لا بد أن يتوافق عمرك وقت السفر مع الفئة العمرية المحجوزة. تضع خطوط الطيران قيوداً على الأشخاص دون 18 عاماً الذين يسافرون وحدهم.\n\n\n"
            "• قد تختلف القيود و السياسات العمرية للسفر بمصاحبة الأطفال لذا يرجى التحقق من شركة القيود الجوية وقت الحجز.",
            style: AppStyles.fontsRegular14(
              context,
            ).copyWith(color: AppColors.bodyTextColor),
          ),
          SizedBox(height: AppSpacing.s32),
          CustomButton(
            onPressed: _onConfirm,
            title: "تأكيد",
            textStyle: AppStyles.fontsBold14(
              context,
            ).copyWith(color: AppColors.whiteColor),
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            borderRadius: 16,
            verPadding: 16,
            size: 16,
          ),
        ],
      ),
    );
  }

  void _onConfirm() {
    if (_passengerCountModel.adults +
            _passengerCountModel.children +
            _passengerCountModel.infants >
        18) {
      showFailureSnackBar("لا يمكن لعدد المسافرين أن يتجاوز 18 شخص!", context);
      return;
    }
    if (_passengerCountModel.infants > _passengerCountModel.adults) {
      showFailureSnackBar(
        "لا يمكن أن يزيد عدد الرضع عن عدد البالغين!",
        context,
      );
      return;
    }
    passengers.adults = _passengerCountModel.adults;
    passengers.children = _passengerCountModel.children;
    passengers.infants = _passengerCountModel.infants;

    GoRouter.of(context).pop<PassengerCountModel>(_passengerCountModel);
  }
}

PassengerCountModel passengers = PassengerCountModel(
  adults: 1,
  children: 0,
  infants: 0,
);
