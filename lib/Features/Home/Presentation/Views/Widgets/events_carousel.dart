import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/events_card.dart';

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5, // عدد الأحداث
      itemBuilder: (context, index, realIndex) {
        return const EventCard();
      },
      options: CarouselOptions(
        height: 245,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enlargeCenterPage: true,
        viewportFraction: .86,
        enableInfiniteScroll: true,
        aspectRatio: 354 / 245,
      ),
    );
  }
}
