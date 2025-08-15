import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class PlaceGeneralInfo extends StatelessWidget {
  const PlaceGeneralInfo({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralInfoItem(
            icon: Assets.iconsCategoryStroke,
            title: place.classification ?? 'أثري',
          ),
          GeneralInfoItem(
            icon: Assets.iconsRankVector,
            title: place.rank != null ? "المركز ${place.rank}" : 'غير مصنف',
          ),
          GeneralInfoItem(
            icon: Assets.iconsLocaionStroke,
            title: place.place ?? 'دمشق',
          ),
        ],
      ),
    );
  }
}
