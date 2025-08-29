import 'package:flutter/material.dart';
import 'package:visit_syria/Core/constants/text_constant.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/AI%20Assistant/Presentation/Views/WIdgets/ai_floating_action_button_builder.dart';
import 'package:visit_syria/Features/AI%20Assistant/Presentation/Views/WIdgets/ai_home_trips_builder.dart';

class AIHomeTripsViewBody extends StatelessWidget {
  const AIHomeTripsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: kAIAssistantAppBarTitle),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 40),
        child: AiFloatingActionButtonBuilder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: AIHomeTripsBuilder(),
    );
  }
}
