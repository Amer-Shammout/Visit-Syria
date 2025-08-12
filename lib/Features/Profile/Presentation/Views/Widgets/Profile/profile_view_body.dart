import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_general_floating_button.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/logout_cubit/logout_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Profile/profile_options.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Profile/profile_view_header.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess && context.mounted) {
          GoRouter.of(context).goNamed(AppRouter.kLoginName);
        }
        if (state is LogoutFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
      },
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ProfileViewHeader()),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(child: ProfileOptions()),
              SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomGeneralFloatingButton(
              onPressed: () => BlocProvider.of<LogoutCubit>(context).logout(),
              title: "تسجيل الخروج",
            ),
          ),
        ],
      ),
    );
  }
}
