import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/cancel_reservation_cubit/cancel_reservation_cubit.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';

class CustomMyBookingFAB extends StatelessWidget {
  const CustomMyBookingFAB({super.key, required this.myBookingModel});

  final MyBookingModel myBookingModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [Shadows.aiBootContainerShadow],
        color: AppColors.whiteColor,
      ),
      child:
          myBookingModel.info.status == 'لم تبدأ بعد'
              ? NotStartedFAB(id: myBookingModel.bookingInfo!.id!)
              : myBookingModel.info.status == 'جارية حاليا'
              ? DoingNowAndFinishedFAB(
                text: 'جارية الآن...',
                color: AppColors.gold,
              )
              : myBookingModel.info.status == 'منتهية'
              ? DoingNowAndFinishedFAB(
                text: 'تم الانتهاء',
                color: AppColors.primary,
              )
              : NotCompletedFAB(
                id: myBookingModel.bookingInfo!.id!,
                price: double.parse(myBookingModel.bookingInfo!.price!),
              ),
    );
  }
}

class NotCompletedFAB extends StatelessWidget {
  const NotCompletedFAB({super.key, required this.id, required this.price});
  final int id;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              GoRouter.of(context).pushNamed(
                AppRouter.kCompletePaymentName,
                extra: BookingModel(booking: Booking(id: id, price: price)),
              );
            },
            title: 'ادفع الآن',
            textStyle: AppStyles.fontsBold14(
              context,
            ).copyWith(color: AppColors.whiteColor),
            borderRadius: 16,
            verPadding: 12,
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            size: 16,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            fillColor: AppColors.red,
            onPressed: () async {
              await BlocProvider.of<CancelReservationCubit>(
                context,
              ).cancelReservation(id);
            },
            title: 'إلغاء الحجز',
            textStyle: AppStyles.fontsBold14(
              context,
            ).copyWith(color: AppColors.whiteColor),
            borderRadius: 16,
            verPadding: 12,
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            size: 16,
          ),
        ),
      ],
    );
  }
}

class DoingNowAndFinishedFAB extends StatelessWidget {
  const DoingNowAndFinishedFAB({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: AppStyles.fontsBold20(context).copyWith(color: color),
        ),
      ),
    );
  }
}

class NotStartedFAB extends StatelessWidget {
  const NotStartedFAB({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: double.infinity,
      fillColor: AppColors.red,
      onPressed: () async {
        await BlocProvider.of<CancelReservationCubit>(
          context,
        ).cancelReservation(id);
      },
      title: 'إلغاء الحجز',
      textStyle: AppStyles.fontsBold14(
        context,
      ).copyWith(color: AppColors.whiteColor),
      borderRadius: 16,
      verPadding: 12,
      icon: Assets.iconsArrow,
      iconColor: AppColors.whiteColor,
      size: 16,
    );
  }
}
