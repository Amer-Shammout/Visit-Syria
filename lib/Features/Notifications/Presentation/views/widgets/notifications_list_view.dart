import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Notifications/Data/Models/notification_model.dart';
import 'package:visit_syria/Features/Notifications/Presentation/manager/delete_notification_cubit/delete_notification_cubit.dart';
import 'package:visit_syria/Features/Notifications/Presentation/views/widgets/notifications_tile.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key, required this.notifications});
  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s16),
      itemBuilder:
          (context, index) => Dismissible(
            key: ValueKey(notifications[index].id),
            confirmDismiss: (_) async {
              final cubit = context.read<DeleteNotificationCubit>();
              cubit.deleteNotifications(notifications[index].id);

              final completer = Completer<bool>();
              final sub = cubit.stream.listen((state) {
                if (state is DeleteNotificationSuccess) {
                  completer.complete(true);
                } else if (state is DeleteNotificationFailure) {
                  completer.complete(false);
                }
              });

              final result = await completer.future;
              await sub.cancel();
              return result;
            },
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: AppColors.whiteColor,
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 200),
                animatedTexts: [
                  FadeAnimatedText(
                    "يرجى الانتظار...",
                    textStyle: AppStyles.fontsRegular16(
                      context,
                    ).copyWith(color: AppColors.bodyTextColor),
                    textAlign: TextAlign.center,
                    duration: Duration(milliseconds: 2500),
                  ),
                ],
                onTap: () {},
              ),
            ),
            // onDismissed: (_) {
            //   context.read<DeleteNotificationCubit>().deleteNotifications(
            //     notifications[index].id,
            //   );
            // },
            child: NotificationsTile(notificationModel: notifications[index]),
          ),
      itemCount: notifications.length,
    );
  }
}
