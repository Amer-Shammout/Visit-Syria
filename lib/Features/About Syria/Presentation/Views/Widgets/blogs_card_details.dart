import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blogs_tags_wrap.dart';

class BlogsCardDetails extends StatelessWidget {
  const BlogsCardDetails({super.key, this.articleModel});

  final ArticleModel? articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          articleModel?.title ?? "دمشق: أقدم مدينة مأهولة في التاريخ",
          style: AppStyles.fontsBold18(
            context,
          ).copyWith(color: AppColors.titleTextColor),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(height: AppSpacing.s8),
        Text(
          articleModel?.body ??
              "تُعد دمشق، عاصمة سوريا، واحدة من أقدم المدن المأهولة باستمرار في العالم، وتتميز بتراثها المعماري والثقافي العريق. تتزين المدينة القديمة بأزقتها الضيقة، وبيوتها الدمشقية ذات النوافذ الخشبية المشغولة، وساحاتها التي تفوح منها رائحة الياسمين. من أبرز معالمها الجامع الأموي، أحد أقدم المساجد في العالم الإسلامي. دمشق ليست مجرد مدينة، بل هي سجل حي لتاريخ الإنسانية.",
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.bodyTextColor),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        SizedBox(height: AppSpacing.s8),
        PostandBlogsTagsWrap(
          tags: articleModel?.tags ?? ["المدن", "ثقافة", "عادات و تقاليد"],
          textStyle: AppStyles.fontsRegular10(
            context,
          ).copyWith(color: AppColors.primary),
        ),
        Spacer(),
        CustomButton(
          height: 30,
          onPressed: () {},
          title: "اقرأ المزيد",
          textStyle: AppStyles.fontsBold12(
            context,
          ).copyWith(color: AppColors.whiteColor),
          borderRadius: 12,
          icon: Assets.iconsArrow,
          iconColor: AppColors.whiteColor,
          size: 16,
          verPadding: 8,
        ),
      ],
    );
  }
}
