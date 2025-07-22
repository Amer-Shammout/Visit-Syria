import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/profile_avatar.dart';

class AvatarandNameandHistory extends StatelessWidget {
  const AvatarandNameandHistory({super.key});

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
              "شادو",
              style: AppStyles.fontsRegular16(
                context,
              ).copyWith(color: AppColors.titleTextColor),
            ),
            SizedBox(height: AppSpacing.s4),
            Text(
              "19/5/2025",
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
