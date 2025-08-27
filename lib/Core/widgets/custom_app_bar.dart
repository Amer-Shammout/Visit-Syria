import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/services/notifications_cubit.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/blink_animation.dart';
import 'package:visit_syria/Core/widgets/profile_avatar.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';

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
              BlocBuilder<NotificationCubit, bool>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<NotificationCubit>(
                            context,
                          ).clearBadge();
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
                      state == true
                          ? PositionedDirectional(
                            start: 14,
                            bottom: 28,
                            child: ConditionalBlink(
                              state: 'Pending',
                              child: CircleAvatar(
                                backgroundColor: AppColors.red,
                                radius: 4,
                              ),
                            ),
                          )
                          : SizedBox.shrink(),
                    ],
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppRouter.kSearchName);
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

              BlocBuilder<GetProfileCubit, GetProfileState>(
                builder: (context, state) {
                  return ProfileAvatar(
                    onTap:
                        () => GoRouter.of(
                          context,
                        ).pushNamed(AppRouter.kProfileName),
                    imageUrl:
                        state is GetProfileSuccess
                            ? GetProfileCubit.userModel!.me!.profile!.photo
                            : null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
