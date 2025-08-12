import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card.dart';

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({super.key, required this.events});

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: events.length >= 3 ? 3 : 2,
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap:
              () => GoRouter.of(
                context,
              ).pushNamed(AppRouter.kEventDetailsName, extra: events[index]),
          child: EventCard(event: events[index]),
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
