import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Weather/Presentation/views/widgets/weather_view_body.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "دمشق",alignmentDirectional: AlignmentDirectional.center,),
      body: WeatherViewBody(),
    );
  }
}