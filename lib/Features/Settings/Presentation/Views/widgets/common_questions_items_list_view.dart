import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Settings/Data/Models/settings_model.dart';
import 'package:visit_syria/Features/Settings/Presentation/Views/widgets/common_question_item.dart';

class CommonQuestionsItemsListView extends StatelessWidget {
  const CommonQuestionsItemsListView({super.key, required this.settings});

  final List<SettingsModel> settings;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:
          (context, index) =>
              CommonQuestionsItem(settingsModel: settings[index]),
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s32),
      itemCount: settings.length,
      clipBehavior: Clip.none,
      physics: BouncingScrollPhysics(),
    );
  }
}
