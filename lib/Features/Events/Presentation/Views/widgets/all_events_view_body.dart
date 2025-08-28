import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/widgets/all_events_list_view.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';

class AllEventsViewBody extends StatelessWidget {
  const AllEventsViewBody({super.key, required this.events});

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return CustomSaveMultiBlocListener(
      child: AllEventsListView(events: events),
    );
  }
}
