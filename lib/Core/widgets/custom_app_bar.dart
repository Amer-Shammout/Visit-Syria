import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/profile_avatar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset(
                  Assets.iconsMenu,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcATop,
                  ),
                  width: 32,
                  height: 32,
                ),
                color: AppColors.titleTextColor,
              ),
              IconButton(
                onPressed: () {
                  // TODO: notification action
                },
                icon: SvgPicture.asset(
                  Assets.iconsNotifications,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcATop,
                  ),
                  width: 24,
                  height: 24,
                ),
                color: AppColors.titleTextColor,
              ),
              IconButton(
                onPressed: () {
                  // TODO: search action
                },
                icon: SvgPicture.asset(
                  Assets.iconsSearch,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcATop,
                  ),
                  width: 24,
                  height: 24,
                ),
                color: AppColors.titleTextColor,
              ),

              const Spacer(),

              ProfileAvatar(
                onTap:
                    () =>
                        GoRouter.of(context).pushNamed(AppRouter.kProfileName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
