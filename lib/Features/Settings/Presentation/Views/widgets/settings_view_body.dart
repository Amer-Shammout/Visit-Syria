import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/settings_constants.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_tile.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) => CustomTile(
            tileModel: kSettingsItems[index],
            onTap: () => routingSettingItem(index, context),
          ),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s12),
      itemCount: kSettingsItems.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Future<Object?>? routingSettingItem(int index, BuildContext context) {
    switch (index) {
      case 0:
        return null;
      case 1:
        return GoRouter.of(context).pushNamed(AppRouter.kPrivacyPolicyName);
      case 2:
        return GoRouter.of(context).pushNamed(AppRouter.kSupportname);
      case 3:
        return GoRouter.of(context).pushNamed(AppRouter.kCommonQuestionsName);
      case 4:
        return GoRouter.of(context).pushNamed(AppRouter.kAboutAppName);
      default:
        return null;
    }
  }
}
