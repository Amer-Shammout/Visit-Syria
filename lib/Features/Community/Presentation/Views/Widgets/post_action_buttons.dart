import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_action_button.dart';

class PostActionButtons extends StatelessWidget {
  const PostActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PostActionButton(
            inActiveIcon: Assets.iconsHeartInActive,
            text: "200",
            activeIcon: Assets.iconsHeartActive,
            isSelected: false,
            onTap: () {},
          ),
        ),
        SizedBox(width: AppSpacing.s8),
        Expanded(
          child: PostActionButton(
            inActiveIcon: Assets.iconsComment,
            text: "200",
            onTap: () => GoRouter.of(context).pushNamed(AppRouter.kAllCommentsName),
          ),
        ),
        SizedBox(width: AppSpacing.s8),
        Expanded(
          child: PostActionButton(
            onTap: () {},
            inActiveIcon: Assets.iconsBookmarkStroke,
            text: "حفظ",
            activeIcon: Assets.iconsBookmarkFill,
            isSelected: false,
          ),
        ),
      ],
    );
  }
}
