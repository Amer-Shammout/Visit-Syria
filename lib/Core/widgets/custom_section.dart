import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_title.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    required this.title,
    this.icon,
    required this.hasSeeAll,
    this.seaAllAction,
    this.section,
    this.widgets,
    this.haspoint = false,
    this.crossAxisAlignment,
  });

  final String title;
  final String? icon;
  final bool hasSeeAll;
  final bool haspoint;
  final VoidCallback? seaAllAction;
  final Widget? section;
  final List<Widget>? widgets;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        CustomTitle(
          mainAxisAlignment:
              crossAxisAlignment != null ? MainAxisAlignment.center : null,
          title: title,
          hasSeeAll: hasSeeAll,
          icon: icon,
          seaAllAction: seaAllAction,
          hasPoint: haspoint,
        ),
        SizedBox(height: AppSpacing.s12),
        section ??
            Column(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              children: widgets!,
            ),
      ],
    );
  }
}
