import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/data/models/drawer_model.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_tile.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Models/ai_trip_model/ai_trip_model.dart';

class AiTripsListView extends StatelessWidget {
  const AiTripsListView({super.key, required this.aiTrips});
  final List<AiTripModel> aiTrips;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      itemBuilder:
          (context, index) => CustomTile(
            tileModel: TileModel(
              title: aiTrips[index].title!,
              icon: Assets.iconsTrips,
            ),
            onTap:
                () => GoRouter.of(context).pushNamed(
                  AppRouter.kAITripDetailsName,
                  extra: aiTrips[index],
                ),
          ),
      itemCount: aiTrips.length,
    );
  }
}
