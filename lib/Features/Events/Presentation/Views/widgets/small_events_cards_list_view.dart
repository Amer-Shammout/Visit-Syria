import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/media.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card.dart';

class SmallEventsCardListView extends StatelessWidget {
  const SmallEventsCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 173,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                end: index == 5 ? 16 : 0,
                start: index == 0 ? 16 : 0,
              ),
              child: AspectRatio(
                aspectRatio: 250 / 173,
                child: EventCard(
                  isSmall: true,
                  event: EventModel(
                    id: 1,
                    name: " مهرجان حلب السينمائي",
                    description: " مهرجان سنوي يعرض أفلامًا محلية وعالمية.",
                    longitude: "37.2345000",
                    latitude: "37.2345000",
                    place: " مسرح حلب",
                    date: "2025-08-15",
                    durationDays: 3,
                    durationHours: 8,
                    tickets: 300,
                    price: "1500.00",
                    eventType: "limited",
                    priceType: "paid",
                    preBooking: 1,
                    media: [
                      Media(
                        id: 18,
                        url:
                            "http://127.0.0.1:8000/storage/events/limited_event.jpg",
                      ),
                    ],
                  ),
                ),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s12),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
