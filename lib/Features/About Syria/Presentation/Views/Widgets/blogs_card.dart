import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blogs_card_details.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blogs_card_image.dart';

class BlogsCard extends StatelessWidget {
  const BlogsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: 12,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: BlogsCardImage()),
            SizedBox(width: AppSpacing.s8),
            Expanded(child: BlogsCardDetails()),
          ],
        ),
      ),
    );
  }
}
