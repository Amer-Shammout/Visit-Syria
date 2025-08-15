import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blog_tag.dart';

class FlightsOfferCardHeader extends StatelessWidget {
  const FlightsOfferCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.iconsAirplaneUp, width: 32, height: 32),
            SizedBox(width: AppSpacing.s8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الخطوط الجوية القطرية",
                  style: AppStyles.fontsRegular14(
                    context,
                  ).copyWith(color: AppColors.titleTextColor),
                ),
                SizedBox(height: AppSpacing.s2),
                Text(
                  "2-2-2025",
                  style: AppStyles.fontsLight8(
                    context,
                  ).copyWith(color: AppColors.bodyTextColor),
                ),
              ],
            ),
          ],
        ),
        PostandBlogTag(tag: "اقتصادي"),
      ],
    );
  }
}
