import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/widgets/event_details_view_body.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EventDetailsViewBody(event: event));
  }
}
