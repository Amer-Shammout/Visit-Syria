import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key, required this.desc});

  final String desc;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: "الوصف",
      hasSeeAll: false,
      section: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          desc,
          textAlign: TextAlign.start,
          style: AppStyles.fontsRegular14(
            context,
          ).copyWith(color: AppColors.bodyTextColor),
        ),
      ),
    );
  }
}
