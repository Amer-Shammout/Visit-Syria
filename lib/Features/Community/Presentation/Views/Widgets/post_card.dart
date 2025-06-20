import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/avatar_and_name_and_history.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/expandable_text.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_action_buttons.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_image.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_tags_wrap.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.hasImage});

  final bool hasImage;

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hasImage ? PostImage() : SizedBox.shrink(),
          hasImage ? SizedBox(height: AppSpacing.s16) : SizedBox.shrink(),
          AvatarandNameandHistory(),
          SizedBox(height: AppSpacing.s16),
          ExpandableText(
            "استيقظت على طقس دمشق الدافئ وبدأت رحلتي الساحرة في قلب التاريخ. أول محطة كانت الجامع الأموي، المزيد تحفة معمارية فريدة تأسر الأنفاس بجمالها وروحانيتها. التجول داخل أروقته كان كرحلة عبر الزمن، وهنا شعرت بعمق الحضارة الإسلامية التي خطت بخطوطها مدينة دمـ المزيد.ثم توجهت إلى قصر العظم، ذلك الصرح العثماني الفخم الذي يسرد حكايات من الماضي عبر جدرانه الضخمة وزخارفه الرائعة. المكان ينبض بالحياة ويوفر لمحة حقيقية عن تاريخ سوريا العريق.لم أستطع مقاومة سوق الحميدية، حيث تختلط رائحة التوابل بألوان الحرف اليدوية وصخب الباعة. تجربة التسوق هناك ليست فقط شراءً، بل رحلة في قلب الثقافة الدمشقية.بعد دمشق، أخذت الطريق إلى تدمر، المدينة التي تفخر بأطلالها الرومانية العظيمة. المشهد من الأعمدة الباقية والأبنية القديمة يشعرك بعظمة الحضارة التي مرت من هنا.وأخيرًا، زرت مدرج بصرى الروماني، حيث يحتفظ الحجر وحتى الصوت بصدى الحفلات والعروض التي كانت تقام فيه منذ قرون. الجلوس هناك والتأمل في المكان كان لحظة استثنائية أضافت بعدًا خاصًا لرحلتي.سوريا، بكل ألوانها وتاريخها، أبهرتني وأثرت في قلبي. رحلة لا تُنسى، أعود منها محملاً بذكريات لا تُقدر بثمن.",
          ),
          SizedBox(height: AppSpacing.s12),
          PostTagsWrap(
            tags: [
              "دمشق",
              "حمص",
              "اثري",
              "ساحل",
              "ثقافة",
              "سورية",
              "اللاذقية",
              "مركز المدينة",
            ],
          ),
          SizedBox(height: AppSpacing.s16),
          PostActionButtons(),
        ],
      ),
    );
  }
}
