import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class TripsCardGeneralInfo extends StatelessWidget {
  const TripsCardGeneralInfo.tripGeneralInfo({
    super.key,
    required this.tripModel,
  });

  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GeneralInfoItem(
          icon: Assets.iconsDate,
          title: tripModel.startDate ?? '15 تموز - 2025',
        ),
        GeneralInfoItem(
          icon: Assets.iconsDuration,
          title: tripModel.days ?? '5 ساعات',
        ),
        GeneralInfoItem(
          icon: Assets.iconsSeason,
          title: tripModel.season ?? 'الصيف',
        ),
        GeneralInfoItem(
          icon: Assets.iconsTicket,
          title: tripModel.remainingTickets?.toString() ?? '10 تذاكر',
        ),
      ],
    );
  }
}
