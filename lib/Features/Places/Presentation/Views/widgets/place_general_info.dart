import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';

class PlaceGeneralInfo extends StatelessWidget {
  const PlaceGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralInfoItem(icon: Assets.iconsCategoryStroke, title: 'أثري'),
          GeneralInfoItem(icon: Assets.iconsRankVector, title: 'المركز 1'),
          GeneralInfoItem(icon: Assets.iconsLocaionStroke, title: 'دمشق'),
        ],
      ),
    );
  }
}
