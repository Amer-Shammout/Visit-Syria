import 'package:flutter/material.dart';
import 'package:visit_syria/Core/constants/post_reject_questions_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class PostRejectCausesViewBody extends StatelessWidget {
  const PostRejectCausesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• ",
                style: AppStyles.fontsRegular16(
                  context,
                ).copyWith(color: AppColors.bodyTextColor),
              ),
              Expanded(
                child: Text(
                  kPostRejectQuestions[index],
                  style: AppStyles.fontsRegular16(
                    context,
                  ).copyWith(color: AppColors.bodyTextColor),
                ),
              ),
            ],
          ),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s32),
      physics: BouncingScrollPhysics(),
      itemCount: kPostRejectQuestions.length,
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
