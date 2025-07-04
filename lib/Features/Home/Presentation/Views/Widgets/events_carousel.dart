import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
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
              () => GoRouter.of(context).pushNamed(AppRouter.kEventDetailsName,),
          child: EventCard(),
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
