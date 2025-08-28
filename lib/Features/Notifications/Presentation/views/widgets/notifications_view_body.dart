import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Notifications/Presentation/manager/get_notifications_cubit/get_notifications_cubit.dart';
import 'package:visit_syria/Features/Notifications/Presentation/views/widgets/notifications_list_view_builder.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool read = false;
    return CustomScrollView(
      clipBehavior: Clip.none,
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            color: AppColors.whiteColor,
            child: TagsListView(
              data: ["غير مقروءة", "مقروءة"],
              onTagSelected: (value, index) {
                read = index == 1;
                BlocProvider.of<GetNotificationsCubit>(
                  context,
                ).getNotifications(read);
              },
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        NotificationsListViewBuilder(read: read),
      ],
    );
  }
}
