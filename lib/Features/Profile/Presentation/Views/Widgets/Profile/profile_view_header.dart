import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/profile_avatar_picker.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';

class ProfileViewHeader extends StatelessWidget {
  const ProfileViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileAvatarPicker(
          userImageUrl: GetProfileCubit.userModel?.me?.profile?.photo,
          canUpload: false,
        ),
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
    );
  }
}
