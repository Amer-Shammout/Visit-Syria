import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/data/models/drawer_model.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.tileModel, required this.onTap});

  final TileModel tileModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.graySwatch[50],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    tileModel.icon,
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcATop,
                    ),
                  ),
                  SizedBox(width: AppSpacing.s8),
                  Text(
                    tileModel.title,
                    style: AppStyles.fontsRegular16(
                      context,
                    ).copyWith(color: AppColors.titleTextColor),
                  ),
                ],
              ),
              SvgPicture.asset(
                Assets.iconsArrow,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcATop,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
