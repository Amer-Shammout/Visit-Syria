import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/manager/delete_save_cubit/delete_save_cubit.dart';
import 'package:visit_syria/Core/manager/set_save_cubit/set_save_cubit.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/city_tag.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card_details.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';

class EventCard extends StatelessWidget {
  final bool isSmall;
  final EventModel event;
  final VoidCallback? action;

  const EventCard({
    super.key,
    this.isSmall = false,
    required this.event,
    this.action,
  });

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
            image: event.media![0],
          ),
          Positioned(
            right: isSmall ? 8 : 16,
            left: isSmall ? 8 : 16,
            top: isSmall ? 8 : 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CityTag(isSmall: isSmall, city: event.place),
                BlocBuilder<DeleteSaveCubit, DeleteSaveState>(
                  builder: (context, state) {
                    return BlocBuilder<SetSaveCubit, SetSaveState>(
                      builder: (context, state) {
                        return CustomBookmarkButton(
                          action: action,
                          isSmall: isSmall,
                          isActive: event.isSaved,
                          id: event.id.toString(),
                          type: 'event',
                          model: event,
                        );
                      },
                    );
                  },
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
