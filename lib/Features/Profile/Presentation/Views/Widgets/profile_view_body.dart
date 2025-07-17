import 'package:flutter/material.dart';
import 'package:visit_syria/Core/constants/profile_tile_constants.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_tile.dart';
import 'package:visit_syria/Core/widgets/profile_avatar_picker.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/custom_logout_button.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ProfileAvatarPicker(userImage: Assets.imagesHama),
                    SizedBox(height: AppSpacing.s16),
                    Text(
                      "أحمد محسن",
                      style: AppStyles.fontsBold20(
                        context,
                      ).copyWith(color: AppColors.titleTextColor),
                    ),
                    SizedBox(height: AppSpacing.s4),
                    Text(
                      "سوريا",
                      style: AppStyles.fontsRegular14(
                        context,
                      ).copyWith(color: AppColors.titleTextColor),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: List.generate(
                      kProfileItems.length,
                      (index) => CustomTile(
                        tileModel: kProfileItems[index],
                        onTap: () => routingDrawerItem(index, context),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
          Positioned(bottom: 0, right: 0, left: 0, child: CustomLogoutButton()),
        ],
      ),
    );
  }

  Future<Object?>? routingDrawerItem(int index, BuildContext context) {
    switch (index) {
      case 0:
        return null;
      case 1:
        return null;
      case 2:
        return null;
      case 3:
        return null;
      default:
        return null;
    }
  }
}
