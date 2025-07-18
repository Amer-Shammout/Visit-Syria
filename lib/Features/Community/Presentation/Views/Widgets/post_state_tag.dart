import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class PostStateTag extends StatelessWidget {
  const PostStateTag({super.key, required this.state});
  final String state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: setBackgroundColor(),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            setIcon(),
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(setColor(), BlendMode.srcATop),
          ),
          SizedBox(width: AppSpacing.s4),
          Text(
            "انتظار",
            style: AppStyles.fontsBold12(context).copyWith(color: setColor()),
          ),
        ],
      ),
    );
  }

  String setIcon() {
    if (state == "pending") {
      return Assets.iconsPending;
    } else if (state == 'accept') {
      return Assets.iconsAccept;
    } else {
      return Assets.iconsReject;
    }
  }

  Color setColor() {
    if (state == "pending") {
      return AppColors.gold;
    } else if (state == 'accept') {
      return AppColors.primary;
    } else {
      return AppColors.red;
    }
  }

  Color setBackgroundColor() {
    if (state == "pending") {
      return AppColors.gold.withValues(alpha: .2);
    } else if (state == 'accept') {
      return AppColors.primary.withValues(alpha: .2);
    } else {
      return AppColors.red.withValues(alpha: .2);
    }
  }
}
