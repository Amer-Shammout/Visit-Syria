import 'package:flutter/material.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_trip_model/ai_trip_model.dart';
import 'package:visit_syria/Features/AI%20Assistant/Presentation/Views/WIdgets/ai_trip_details_view_body.dart';

class AiTripResultDetails extends StatelessWidget {
  const AiTripResultDetails({super.key, required this.aiTripModel});
  final AiTripModel aiTripModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AITripDetailsViewBody(aiTripModel: aiTripModel));
  }
}
