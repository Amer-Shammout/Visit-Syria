import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';

class CommunityViewHeader extends StatelessWidget {
  const CommunityViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              isEnabled: false,
              onTap: () => GoRouter.of(context).pushNamed(AppRouter.kCreatePostName),
              hint: "أنشئ منشور",
              prefixIcon: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 12),
                  child: SvgPicture.asset(
                    Assets.iconsCreatePost,
                    alignment: Alignment.center,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      AppColors.graySwatch,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: AppSpacing.s8),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.iconsImage,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcATop,
              ),
            ),
            padding: EdgeInsets.zero,
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}
