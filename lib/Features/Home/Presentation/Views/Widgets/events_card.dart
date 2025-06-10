import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/utils/widgets/custom_icon_button.dart';
import 'package:visit_syria/Core/utils/widgets/custom_image.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/city_tag.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card_details.dart';

class EventCard extends StatelessWidget {
  // final String? imageUrl;
  // final String? city;
  // final String? eventName;
  // final String? date;
  // final String? duration;
  // final VoidCallback? onDetailsTap;
  // final VoidCallback? onSaveTap;
  // final bool? isSaved;

  const EventCard({
    super.key,
    // this.imageUrl,
    // this.city,
    // this.eventName,
    // this.date,
    // this.duration,
    // this.onDetailsTap,
    // this.onSaveTap,
    // this.isSaved = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [Shadows.commonShadow],
      ),
      child: Stack(
        children: [
          CustomImage(
            borderRadius: 32,
            height: 235,
          ),
          Positioned(
            right: 16,
            left: 16,
            top: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CityTag(),
                CustomIconButton(
                  onTap: () {},
                  inActiveIcon: Assets.iconsBookmarkStroke,
                  isActive: false,
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            left: 16,
            bottom: 16,
            child: EventsCardDetails(),
          ),
        ],
      ),
    );
  }
}
