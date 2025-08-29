import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_my_booking_cubit/get_my_booking_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Events%20&%20My%20Flights/my_events_list_view.dart';

class MyEventsListViewBuilder extends StatelessWidget {
  const MyEventsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyBookingCubit, GetMyBookingState>(
      builder: (context, state) {
        if (state is GetMyBookingEmpty) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsEmptyTrips,
            text: 'لا يوجد أحداث محجوزة حالياً',
          );
        }
        if (state is GetMyBookingFailure) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFailure,
            text: state.errMessage,
            buttonText: 'إعادة المحاولة',
            onTap: () async {
              await BlocProvider.of<GetMyBookingCubit>(
                context,
              ).getMyBooking('flight', category);
            },
          );
        }
        if (state is GetMyBookingSuccess) {
          state.getMyBookingModel.bookings![0].category = category;
          return MyEventsListView(bookings: state.getMyBookingModel.bookings!);
        }
        return Center(child: CustomLoadingIndicator());
      },
    );
  }
}
