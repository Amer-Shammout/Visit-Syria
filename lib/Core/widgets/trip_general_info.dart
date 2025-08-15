import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class MiniTripCardGeneralInfo extends StatelessWidget {
  const MiniTripCardGeneralInfo({
    super.key,
    this.mainAxisAlignment,
    required this.tripModel,
  });
  final MainAxisAlignment? mainAxisAlignment;
  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralInfoItem(
              icon: Assets.iconsDate,
              title: tripModel.startDate ?? '15 تموز - 2025',
              fontSize: 10,
              iconSize: 12,
            ),
            SizedBox(height: AppSpacing.s8),
            GeneralInfoItem(
              icon: Assets.iconsTicket,
              title: tripModel.remainingTickets?.toString() ?? '100 تذكرة',
              fontSize: 10,
              iconSize: 12,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            GeneralInfoItem(
              icon: Assets.iconsDuration,
              title: tripModel.days ?? '5 ساعات',
              fontSize: 10,
              iconSize: 12,
            ),
            SizedBox(height: AppSpacing.s8),
            GeneralInfoItem(
              icon: Assets.iconsSeason,
              title: tripModel.season ?? 'صيف',
              fontSize: 10,
              iconSize: 12,
            ),
          ],
        ),
      ],
    );
  }
}
