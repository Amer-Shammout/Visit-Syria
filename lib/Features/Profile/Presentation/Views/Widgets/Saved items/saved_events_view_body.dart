import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/widgets/all_events_list_view.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/media.dart';

class SavedEventsViewBody extends StatelessWidget {
  const SavedEventsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AllEventsListView(
      events: [
        EventModel(
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
              url: "http://127.0.0.1:8000/storage/events/limited_event.jpg",
            ),
          ],
        ),
        EventModel(
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
              url: "http://127.0.0.1:8000/storage/events/limited_event.jpg",
            ),
          ],
        ),
        EventModel(
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
              url: "http://127.0.0.1:8000/storage/events/limited_event.jpg",
            ),
          ],
        ),
      ],
    );
  }
}
