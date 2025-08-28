import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_expanstion_tile.dart';
import 'package:visit_syria/Features/Notifications/Data/Models/notification_model.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({super.key, required this.notificationModel});
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomExpansionTile(
        iconSize: 32,
        title: notificationModel.title,
        icon: Assets.iconsLogoIcon,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              notificationModel.message,
              style: AppStyles.fontsRegular14(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
