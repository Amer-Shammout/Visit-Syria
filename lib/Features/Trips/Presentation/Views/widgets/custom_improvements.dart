import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';

class CustomImprovements extends StatelessWidget {
  const CustomImprovements({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: "التحسينات",
      hasSeeAll: false,
      section: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder:
              (context, index) => Text("تم تغيير المشرف على الرحلة السابقة."),
          separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s8),
          itemCount: 4,
        ),
      ),
    );
  }
}