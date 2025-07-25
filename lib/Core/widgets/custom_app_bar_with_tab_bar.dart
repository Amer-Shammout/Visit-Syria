import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_tab_bar.dart';

class CustomAppBarWithTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [Shadows.secondaryBarShadow]),
      child: AppBar(
        titleSpacing: 0,
        toolbarHeight: 100,
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        leading: IconButton(
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: () {
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
        title: Text(
          "الفنادق و المطاعم",
          style: AppStyles.fontsBold20(
            context,
          ).copyWith(color: AppColors.primary, fontSize: 20),
        ),
        bottom: CustomTabBar(),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(130);
}
