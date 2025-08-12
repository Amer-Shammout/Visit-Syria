import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/profile_avatar.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/recent_comment.dart';

class AvatarandNameandHistory extends StatelessWidget {
  const AvatarandNameandHistory({super.key,  this.comment});

  final RecentComment? comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(),
        SizedBox(width: AppSpacing.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment?.userName ?? "شادو",
              style: AppStyles.fontsRegular16(
                context,
              ).copyWith(color: AppColors.titleTextColor),
            ),
            SizedBox(height: AppSpacing.s4),
            Text(
              comment?.createdAt ?? "19/5/2025",
              textDirection: TextDirection.ltr,
              style: AppStyles.fontsLight10(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
