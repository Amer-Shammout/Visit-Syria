import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/city_tag.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card_details.dart';

class EventCard extends StatelessWidget {
  final bool isSmall;
  final EventModel event;

  const EventCard({super.key, this.isSmall = false, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmall ? 173 : 235,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isSmall ? 22 : 32),
        boxShadow: [Shadows.commonShadow],
      ),
      child: Stack(
        children: [
          CustomImage(
            borderRadius: isSmall ? 22 : 32,
            height: isSmall ? 173 : 235,
          ),
          Positioned(
            right: isSmall ? 8 : 16,
            left: isSmall ? 8 : 16,
            top: isSmall ? 8 : 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CityTag(isSmall: isSmall, city: event.place),
                CustomIconButton(
                  onTap: () {},
                  inActiveIcon: Assets.iconsBookmarkStroke,
                  isActive: false,
                  isSmall: isSmall,
                ),
              ],
            ),
          ),
          Positioned(
            right: isSmall ? 8 : 16,
            left: isSmall ? 8 : 16,
            bottom: isSmall ? 8 : 16,
            child: EventsCardDetails(isSmall: isSmall, event: event),
          ),
        ],
      ),
    );
  }
}
