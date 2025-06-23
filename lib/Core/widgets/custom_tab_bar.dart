import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, this.onTap});

  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      isScrollable: false,
      indicatorColor: AppColors.primary,
      indicatorWeight: 2,
      labelStyle: AppStyles.fontsBold18(
        context,
      ).copyWith(color: AppColors.primary),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [Tab(text: "المطاعم"), Tab(text: "الفنادق")],
      unselectedLabelStyle: AppStyles.fontsBold18(
        context,
      ).copyWith(color: AppColors.bodyTextColor),
      onTap: onTap,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
