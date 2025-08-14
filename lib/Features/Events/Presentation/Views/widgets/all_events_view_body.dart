import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/widgets/all_events_list_view.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';

class AllEventsViewBody extends StatelessWidget {
  const AllEventsViewBody({super.key, required this.events});

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return AllEventsListView(events: events);
  }
}
