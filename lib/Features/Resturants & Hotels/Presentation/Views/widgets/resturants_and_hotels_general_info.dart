import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class ResturantsAndHotelsGeneralInfo extends StatelessWidget {
  const ResturantsAndHotelsGeneralInfo({super.key, this.place});

  final PlaceModel? place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralInfoItem(
            icon: Assets.iconsCategoryStroke,
            title: place?.type ?? 'مطعم',
          ),
          GeneralInfoItem(
            icon: Assets.iconsBuildings,
            title:
                place?.numberOfBranches != null
                    ? '${place?.numberOfBranches} فرع'
                    : '1 غرع',
          ),
          GeneralInfoItem(
            icon: Assets.iconsLocaionStroke,
            title: place?.place ?? 'دمشق',
          ),
        ],
      ),
    );
  }
}
