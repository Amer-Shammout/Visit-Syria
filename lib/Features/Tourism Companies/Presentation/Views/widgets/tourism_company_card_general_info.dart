import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';

class TourismCompanyCardGeneralInfo extends StatelessWidget {
  const TourismCompanyCardGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GeneralInfoItem(icon: Assets.iconsMedal, title: '10 سنوات خبرة'),
        GeneralInfoItem(icon: Assets.iconsTripsInActive, title: '10 رحلات'),
      ],
    );
  }
}