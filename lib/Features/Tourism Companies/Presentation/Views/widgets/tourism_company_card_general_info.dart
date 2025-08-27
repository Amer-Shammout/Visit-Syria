import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';

class TourismCompanyCardGeneralInfo extends StatelessWidget {
  const TourismCompanyCardGeneralInfo({super.key, required this.company});

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GeneralInfoItem(
          icon: Assets.iconsMedal,
          title: '${company.yearsOfExperience} سنوات خبرة',
        ),
        GeneralInfoItem(
          icon: Assets.iconsTripsInActive,
          title: '${company.numberOfTrips} رحلات',
        ),
      ],
    );
  }
}
