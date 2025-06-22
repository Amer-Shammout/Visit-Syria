import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blogs_tags_wrap.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class AboutSyriaViewBody extends StatelessWidget {
  const AboutSyriaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: TagsListView(
            data: ['الكل', "دمشق", "حمص", "أماكن أثرية", "ساحل", "طبيعة"],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
          sliver: SliverList.separated(
            itemBuilder:
                (context, index) => CustomCardBackground(
                  padding: 12,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox.expand(
                                  child: Image.asset(
                                    Assets.imagesDaraa,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                start: 8,
                                top: 8,
                                child: CustomIconButton(
                                  inActiveIcon: Assets.iconsBookmarkStroke,
                                  onTap: () {},
                                  isActive: false,
                                  activeIcon: Assets.iconsBookmarkFill,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: AppSpacing.s8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "دمشق: أقدم مدينة مأهولة في التاريخ",
                                style: AppStyles.fontsBold18(
                                  context,
                                ).copyWith(color: AppColors.titleTextColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              SizedBox(height: AppSpacing.s8),
                              Text(
                                "تُعد دمشق، عاصمة سوريا، واحدة من أقدم المدن المأهولة باستمرار في العالم، وتتميز بتراثها المعماري والثقافي العريق. تتزين المدينة القديمة بأزقتها الضيقة، وبيوتها الدمشقية ذات النوافذ الخشبية المشغولة، وساحاتها التي تفوح منها رائحة الياسمين. من أبرز معالمها الجامع الأموي، أحد أقدم المساجد في العالم الإسلامي. دمشق ليست مجرد مدينة، بل هي سجل حي لتاريخ الإنسانية.",
                                style: AppStyles.fontsRegular12(
                                  context,
                                ).copyWith(color: AppColors.bodyTextColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              SizedBox(height: AppSpacing.s8),
                              PostandBlogsTagsWrap(
                                tags: ["المدن", "ثقافة", "عادات و تقاليد"],
                                textStyle: AppStyles.fontsRegular10(
                                  context,
                                ).copyWith(color: AppColors.primary),
                              ),
                              SizedBox(height: AppSpacing.s8),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            separatorBuilder:
                (context, index) => SizedBox(height: AppSpacing.s16),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
