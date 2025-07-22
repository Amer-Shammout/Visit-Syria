import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/place_details_view_body.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        surfaceTintColor: AppColors.whiteColor,
      ),
      body: PlaceDetailsViewBody(),
    );
  }
}
