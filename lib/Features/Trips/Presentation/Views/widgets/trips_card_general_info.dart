import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';

class TripsCardGeneralInfo extends StatelessWidget {
  const TripsCardGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GeneralInfoItem(icon: Assets.iconsDate, title: '15 تموز - 2025'),
        GeneralInfoItem(icon: Assets.iconsDuration, title: '5 ساعات'),
        GeneralInfoItem(icon: Assets.iconsSeason, title: 'الصيف'),
        GeneralInfoItem(icon: Assets.iconsTicket, title: '10 تذاكر'),
      ],
    );
  }
}
