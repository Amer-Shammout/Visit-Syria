import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.graySwatch[300]!)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.primary.withValues(alpha: .5),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 32,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsHomeInActive),
            activeIcon: SvgPicture.asset(Assets.iconsHomeActive),
            label: 'استكشاف',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsCategoryActive),
            activeIcon: SvgPicture.asset(Assets.iconsCategoryInActive),
            label: 'الحجوزات',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsTripsInActive),
            activeIcon: SvgPicture.asset(Assets.iconsTripsActive),
            label: 'الخريطة',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsCommunityInActive),
            activeIcon: SvgPicture.asset(Assets.iconsCommunityActive),
            label: 'الدردشة',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.iconsSyriaInActive),
            activeIcon: SvgPicture.asset(Assets.iconsSyriaActive),
            label: 'الملف',
          ),
        ],
      ),
    );
  }
}
