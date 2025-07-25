import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/media.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card.dart';

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap:
              () => GoRouter.of(context).pushNamed(AppRouter.kEventDetailsName),
          child: EventCard(
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
                  url: "http://127.0.0.1:8000/storage/events/limited_event.jpg",
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        clipBehavior: Clip.none,
        height: 235,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enlargeCenterPage: true,
        viewportFraction: .87,
        enableInfiniteScroll: true,
        aspectRatio: 354 / 245,
      ),
    );
  }
}
