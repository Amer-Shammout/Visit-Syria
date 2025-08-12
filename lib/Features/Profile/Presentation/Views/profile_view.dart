import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/logout_cubit/logout_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Profile/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CustomLoadingIndicator(),
      inAsyncCall: context.select(
        (LogoutCubit cubit) => cubit.state is LogoutLoading,
      ),
      child: Scaffold(
        appBar: CustomAppBar2(hasTitle: true, title: "الملف الشخصي"),
        body: ProfileViewBody(),
      ),
    );
  }
}
