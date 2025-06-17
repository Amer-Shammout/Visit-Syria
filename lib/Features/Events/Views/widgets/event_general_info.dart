import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';

class EventGenerlInfo extends StatelessWidget {
  const EventGenerlInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralInfoItem(icon: Assets.iconsDate, title: '15 أيار - 2025'),
              SizedBox(height: AppSpacing.s8),
              GeneralInfoItem(
                icon: Assets.iconsLocaionStroke,
                title: 'حمص، وادي النصارى',
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralInfoItem(icon: Assets.iconsDuration, title: '5 ساعات'),
              SizedBox(height: AppSpacing.s8),

              GeneralInfoItem(icon: Assets.iconsTicket, title: 'غير محدود'),
            ],
          ),
        ],
      ),
    );
  }
}
