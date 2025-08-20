import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar2({
    super.key,
    this.title,
    this.alignmentDirectional = AlignmentDirectional.centerStart,
    this.trailing,
    this.hasTitle = true, this.onTap,
  });

  final String? title;
  final AlignmentDirectional alignmentDirectional;
  final Widget? trailing;
  final bool hasTitle;
  final VoidCallback? onTap;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 32,
                    padding: EdgeInsets.zero,
                    onPressed: onTap ?? () {
                      GoRouter.of(context).pop();
                    },
                    icon: Transform.flip(
                      flipX: true,
                      child: SvgPicture.asset(
                        Assets.iconsArrow,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcATop,
                        ),
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                  hasTitle ? SizedBox(width: AppSpacing.s8) : SizedBox.shrink(),
                  hasTitle
                      ? Align(
                        alignment: alignmentDirectional,
                        child: Text(
                          title!,
                          style: AppStyles.fontsBold20(
                            context,
                          ).copyWith(color: AppColors.primary, fontSize: 20),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
              trailing ?? SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
