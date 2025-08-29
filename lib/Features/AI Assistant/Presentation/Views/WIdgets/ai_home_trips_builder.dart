import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/text_constant.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/AI%20Assistant/Presentation/Managers/get_ai_trips_cubit/get_ai_trips_cubit.dart';
import 'package:visit_syria/Features/AI%20Assistant/Presentation/Views/WIdgets/ai_trips_list_view.dart';

class AIHomeTripsBuilder extends StatelessWidget {
  const AIHomeTripsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAiTripsCubit, GetAiTripsState>(
      builder: (context, state) {
        if (state is GetAiTripsFailure) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFailure,
            text: state.errMessage,
            onTap: () async {
              await BlocProvider.of<GetAiTripsCubit>(context).getAITrips();
            },
            buttonText: kTryAgainButtonText,
          );
        }
        if (state is GetAiTripsEmpty) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsEmptyTrips,
            text: kEmptyTripsText,
          );
        }
        if (state is GetAiTripsSuccess) {
          for (var i = 0; i < state.aiTrips.length; i++) {
            state.aiTrips[i].showButton = false;
          }
          return AiTripsListView(aiTrips: state.aiTrips);
        }

        return Center(child: CustomLoadingIndicator());
      },
    );
  }
}
