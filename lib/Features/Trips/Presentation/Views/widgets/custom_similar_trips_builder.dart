import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_similar_trips.dart';
import 'package:visit_syria/Features/Trips/Presentation/manager/get_similar_trips_cubit/get_similar_trips_cubit.dart';

class CustomSimilarTripsBuilder extends StatelessWidget {
  const CustomSimilarTripsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSimilarTripsCubit, GetSimilarTripsState>(
      builder: (context, state) {
        if (state is GetSimilarTripsSuccess) {
          return Column(
            children: [
              SizedBox(height: AppSpacing.s32),
              CustomMiniTripsSection(
                trips: state.similarTrips,
                title: "الرحلات المشابهة",
              ),
            ],
          );
        }
        if (state is GetSimilarTripsEmpty) {
          return SizedBox.shrink();
        }
        if (state is GetSimilarTripsFailure) {
          return Column(
            children: [
              SizedBox(height: AppSpacing.s32),
              Center(child: Text(state.errMessage)),
            ],
          );
        } else {
          return Column(
            children: [
              SizedBox(height: AppSpacing.s32),
              Center(child: CustomLoadingIndicator()),
            ],
          );
        }
      },
    );
  }
}
