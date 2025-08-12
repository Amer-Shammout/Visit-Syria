import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/update_profile_cubit/update_profile_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Personal%20Info/personal_view_body.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CustomLoadingIndicator(),
      inAsyncCall: context.select(
        (UpdateProfileCubit cubit) => cubit.state is UpdateProfileLoading,
      ),
      child: Scaffold(
        appBar: CustomAppBar2(hasTitle: true, title: "المعلومات الشخصية"),
        body: PersonalViewBody(),
      ),
    );
  }
}

