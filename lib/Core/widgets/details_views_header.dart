import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';

class DetailsViewsHeader extends StatelessWidget {
  const DetailsViewsHeader({super.key, this.hasActionButton = true});
  final bool hasActionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          inActiveIcon: Assets.iconsArrow,
          onTap: () => GoRouter.of(context).pop(),
          isActive: false,
        ),
        hasActionButton
            ? CustomIconButton(
              inActiveIcon: Assets.iconsBookmarkStroke,
              onTap: () {},
              isActive: false,
              activeIcon: Assets.iconsBookmarkFill,
            )
            : SizedBox.shrink(),
      ],
    );
  }
}
