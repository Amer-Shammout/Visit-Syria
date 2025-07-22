import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Events/Views/widgets/all_events_view_body.dart';

class AllEventsView extends StatelessWidget {
  const AllEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'الأحداث الرائجة'),
      body: AllEventsViewBody(),
    );
  }
}
