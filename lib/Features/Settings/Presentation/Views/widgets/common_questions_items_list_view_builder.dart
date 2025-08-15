import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Settings/Presentation/Manager/get_settings_by_type_cubit/get_settings_by_type_cubit.dart';
import 'package:visit_syria/Features/Settings/Presentation/Manager/get_settings_by_type_cubit/get_settings_by_type_state.dart';
import 'package:visit_syria/Features/Settings/Presentation/Views/widgets/common_questions_items_list_view.dart';

class CommonQuestionsItemsListViewBuilder extends StatelessWidget {
  const CommonQuestionsItemsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSettingsByTypeCubit, GetSettingsByTypeState>(
      builder: (context, state) {
        if (state is GetSettingsByTypeSuccess) {
          return CommonQuestionsItemsListView(settings: state.settings);
        } else if (state is GetSettingsByTypeFailure) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFailure,
            text: state.message,
            buttonText: "إعادة المحاولة",
            onTap:
                () => BlocProvider.of<GetSettingsByTypeCubit>(
                  context,
                ).fetchSettings(type: "common_question"),
          );
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
