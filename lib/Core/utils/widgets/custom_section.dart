import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_title.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    required this.title,
    this.icon,
    required this.hasSeeAll,
    this.seaAllAction,
    required this.section,
  });

  final String title;
  final String? icon;
  final bool hasSeeAll;
  final VoidCallback? seaAllAction;
  final Widget section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(
          title: title,
          hasSeeAll: hasSeeAll,
          icon: icon,
          seaAllAction: seaAllAction,
        ),
        SizedBox(height: AppSpacing.s8),
        section,
      ],
    );
  }
}
