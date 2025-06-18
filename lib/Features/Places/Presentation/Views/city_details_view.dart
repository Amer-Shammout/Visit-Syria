import 'package:flutter/material.dart';
import 'package:visit_syria/Core/data/models/city_model.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/city_details_view_body.dart';

class CityDetailsView extends StatelessWidget {
  const CityDetailsView({super.key, required this.cityModel});

  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        surfaceTintColor: AppColors.whiteColor,
      ),
      body: CityDetailsViewBody(cityModel: cityModel),
    );
  }
}
