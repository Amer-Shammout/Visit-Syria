import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/data/models/drawer_model.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({super.key, required this.drawerModel});

  final DrawerModel drawerModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: SvgPicture.asset(
        drawerModel.icon,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcATop),
      ),
      title: Text(
        drawerModel.title,
        style: AppStyles.fontsBold16(
          context,
        ).copyWith(color: AppColors.titleTextColor),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}
