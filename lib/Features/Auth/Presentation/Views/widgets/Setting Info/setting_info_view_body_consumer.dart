import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/set_profile_cubit/set_profile_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Setting%20Info/setting_info_view_body.dart';

class SettingInfoViewBodyConsumer extends StatelessWidget {
  const SettingInfoViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetProfileCubit, SetProfileState>(
      listener: (context, state) {
        if (state is SetProfileFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is SetProfileSuccess) {
          log("${state.profileModel}");
          GoRouter.of(context).pushNamed(AppRouter.kPreferencesName);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CustomLoadingIndicator(),
          inAsyncCall: state is SetProfileLoading,
          child: SettingInfoViewBody(),
        );
      },
    );
  }
}
