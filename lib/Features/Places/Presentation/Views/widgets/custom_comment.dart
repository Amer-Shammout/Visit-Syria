import 'package:flutter/material.dart';
import 'package:visit_syria/Core/data/models/comment_model/comment_model.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/avatar_and_name_and_history.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Core/widgets/custom_rating.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/comment.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/recent_comment.dart';

class CustomComment extends StatelessWidget {
  const CustomComment({
    super.key,
    this.hasRate = true,
    this.recentComment,
    this.comment,
    this.postComment,
  });

  final bool hasRate;
  final RecentComment? recentComment;
  final CommentModel? comment;
  final Comment? postComment;

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvatarandNameandHistory(
                date:
                    comment?.createdAt ??
                    postComment?.createdAt ??
                    recentComment!.createdAt!,
                name:
                    comment?.user?.name ??
                    postComment?.user?.name ??
                    recentComment!.userName!,
              ),
              hasRate
                  ? CustomRating(
                    textColor: AppColors.titleTextColor,
                    rating: recentComment?.ratingValue ?? comment?.userRating,
                  )
                  : SizedBox.shrink(),
            ],
          ),
          SizedBox(height: AppSpacing.s8),
          Text(
            recentComment?.body ??
                comment?.body ??
                postComment?.comment ??
                'باب شرقي في دمشق مكان رائع يمزج بين التاريخ والحياة اليومية. الأسواق القديمة والأزقة الضيقة تمنحك تجربة فريدة والناس ودودون. أنصح بزيارة الحمّام والمطاعم التقليدية للاستمتاع بالثقافة الشامية الحقيقية.',
            style: AppStyles.fontsRegular14(
              context,
            ).copyWith(color: AppColors.bodyTextColor),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
