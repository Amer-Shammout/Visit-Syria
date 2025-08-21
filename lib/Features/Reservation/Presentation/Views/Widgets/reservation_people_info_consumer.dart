import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Manager/event_and_trip_booking_cubit/event_and_trips_booking_cubit.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/reservation_people_info_view_body.dart';

class ReservationPeopleInfoConsumer extends StatelessWidget {
  const ReservationPeopleInfoConsumer({
    super.key,
    required this.reservationModel,
  });

  final ReservationModel reservationModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EventAndTripsBookingCubit, EventAndTripsBookingState>(
          listener: (context, state) {
            if (state is EventAndTripsBookingFailure) {
              showFailureSnackBar(state.errMessage, context);
            }
            if (state is EventAndTripsBookingSuccess) {
              GoRouter.of(context).pushReplacementNamed(
                AppRouter.kPaymentInfoName,
                extra: state.bookingModel,
              );
            }
          },
        ),
      ],
      child: BlocBuilder<EventAndTripsBookingCubit, EventAndTripsBookingState>(
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: CustomLoadingIndicator(),
            inAsyncCall: state is EventAndTripsBookingLoading,
            child: ReservationPeopleInfoViewBody(
              reservationModel: reservationModel,
            ),
          );
        },
      ),
    );
  }
}
