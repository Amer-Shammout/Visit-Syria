import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/AI%20Assistant/Presentation/Views/WIdgets/ai_generate_trip_view_body.dart';

class AIGenerateTripView extends StatelessWidget {
  const AIGenerateTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'المساعد الذكي'),
      body: AIGenerateTripViewBody(),
    );
  }
}
