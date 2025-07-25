import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/widgets/all_events_list_view.dart';
import 'package:visit_syria/Features/Events/Presentation/manager/get_all_events_cubit/get_all_events_cubit.dart';

class AllEventsViewBodyBuilder extends StatelessWidget {
  const AllEventsViewBodyBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllEventsCubit, GetAllEventsState>(
      builder: (context, state) {
        if (state is GetAllEventsFailure) {
          return Center(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.errMessage,
              buttonText: "إعادة المحاولة",
              onTap:
                  () =>
                      BlocProvider.of<GetAllEventsCubit>(
                        context,
                      ).getAllEvents(),
            ),
          );
        } else if (state is GetAllEventsSuccess) {
          return AllEventsListView(events:state.events);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
