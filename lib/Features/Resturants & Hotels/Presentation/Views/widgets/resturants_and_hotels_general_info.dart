import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';

class ResturantsAndHotelsGeneralInfo extends StatelessWidget {
  const ResturantsAndHotelsGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralInfoItem(icon: Assets.iconsCategoryStroke, title: 'مطعم'),
          GeneralInfoItem(icon: Assets.iconsBuildings, title: '1 فرع'),
          GeneralInfoItem(icon: Assets.iconsLocaionStroke, title: 'دمشق'),
        ],
      ),
    );
  }
}