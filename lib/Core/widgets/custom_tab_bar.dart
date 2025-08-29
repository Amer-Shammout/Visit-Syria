import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, this.onTap, this.tab1, this.tab2});

  final void Function(int)? onTap;
  final String? tab1, tab2;
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
      tabs: [Tab(text: tab1 ?? "المطاعم"), Tab(text: tab2 ?? "الفنادق")],
      unselectedLabelStyle: AppStyles.fontsBold18(
        context,
      ).copyWith(color: AppColors.bodyTextColor),
      onTap: onTap,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
