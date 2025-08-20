import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';

class EventGenerlInfo extends StatelessWidget {
  const EventGenerlInfo({super.key, required this.event});

  final EventModel event;

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
              GeneralInfoItem(icon: Assets.iconsDate, title: event.date ?? ''),
              SizedBox(height: AppSpacing.s8),
              GeneralInfoItem(
                icon: Assets.iconsLocaionStroke,
                title: event.place ?? '',
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralInfoItem(
                icon: Assets.iconsDuration,
                title: setDurationVal(event.durationDays, event.durationHours),
              ),
              SizedBox(height: AppSpacing.s8),

              GeneralInfoItem(
                icon: Assets.iconsTicket,
                title:
                    event.eventType != null
                        ? event.eventType == "limited"
                            ? event.remainingTickets!.toString()
                            : "غير محدودة"
                        : "",
              ),
            ],
          ),
        ],
      ),
    );
  }

  String setDurationVal(int? durationDays, int? durationHours) {
    if (durationDays != null) {
      return "$durationDays يوم";
    } else {
      return "$durationDays ساعة";
    }
  }
}
