import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Notifications/Presentation/manager/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:visit_syria/Features/Notifications/Presentation/views/widgets/notifications_list_view.dart';

class NotificationsListViewBuilder extends StatelessWidget {
  const NotificationsListViewBuilder({super.key, required this.read});
  final bool read;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
      builder: (context, state) {
        if (state is GetNotificationsFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.errMessage,
              buttonText: "إعادة المحاولة",
              onTap:
                  () => BlocProvider.of<GetNotificationsCubit>(
                    context,
                  ).getNotifications(read),
            ),
          );
        } else if (state is GetNotificationsEmpty) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsEmptyNotifications,
              text: "لا يوجد اشعارات حالياً!",
            ),
          );
        } else if (state is GetNotificationsSuccess) {
          return NotificationsListView(notifications: state.notification);
        } else {
          return SliverFillRemaining(
            child: Center(child: CustomLoadingIndicator()),
          );
        }
      },
    );
  }
}
