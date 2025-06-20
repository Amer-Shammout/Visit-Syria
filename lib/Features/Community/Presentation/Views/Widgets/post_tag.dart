import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class PostTag extends StatelessWidget {
  const PostTag({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffE5F0F1),
      ),
      child: Text(
        tag,
        style: AppStyles.fontsRegular12(
          context,
        ).copyWith(color: AppColors.primary),
      ),
    );
  }
}
