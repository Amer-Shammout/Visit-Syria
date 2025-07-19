import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Saved%20items/saved_trips_view_body.dart';

class SavedTripsView extends StatelessWidget {
  const SavedTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true,title: "الرحلات المحفوظة",),
      body: SavedTripsViewBody(),
    );
  }
}