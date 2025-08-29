import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/home_cubit/home_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/cancel_reservation_cubit/cancel_reservation_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_my_booking_cubit/get_my_booking_cubit.dart';

class ReservationConsumer extends StatelessWidget {
  const ReservationConsumer({
    super.key,
    required this.widget,
    required this.type,
  });
  final Widget widget;
  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CancelReservationCubit, CancelReservationState>(
      listener: (context, state) {
        if (state is CancelReservationFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is CancelReservationNotPermission) {
          showFailureSnackBar(state.message, context);
        }
        if (state is CancelReservationSuccess) {
          showSuccessSnackBar('تم إلغاء الحجز بنجاح!', context);
          BlocProvider.of<GetMyBookingCubit>(
            context,
          ).getMyBooking(type, 'الكل');
          BlocProvider.of<HomeCubit>(context).fetchHomeData();
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CustomLoadingIndicator(),
          inAsyncCall: state is CancelReservationLoading,
          child: Scaffold(body: widget),
        );
      },
    );
  }
}
