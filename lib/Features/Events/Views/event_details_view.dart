import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Events/Views/widgets/event_details_view_body.dart';

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventDetailsViewBody(),
    );
  }
}