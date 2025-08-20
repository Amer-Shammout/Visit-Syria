import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,

    this.data,
    this.title,
    this.icon,
    this.useHeader = true,
    required this.child,
  });
  final Widget child;
  final dynamic data;
  final String? title;
  final String? icon;
  final bool useHeader;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            useHeader
                ? Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 4,
                      leading: SvgPicture.asset(icon!),
                      title: Text(
                        title!,
                        style: AppStyles.fontsBold24(
                          context,
                        ).copyWith(color: AppColors.titleTextColor),
                      ),
                    ),
                    SizedBox(height: AppSpacing.s20),
                  ],
                )
                : SizedBox.shrink(),
            child,
          ],
        ),
      ),
    );
  }
}
