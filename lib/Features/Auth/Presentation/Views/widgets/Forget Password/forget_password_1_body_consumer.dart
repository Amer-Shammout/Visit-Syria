import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_body_1.dart';

class ForgetPassword1ViewBodyConsumer extends StatelessWidget {
  const ForgetPassword1ViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordFailure) {
              showFailureSnackBar(state.errMessage, context);
            }
            if (state is ForgetPasswordSuccess) {
              GoRouter.of(context).pushNamed(
                AppRouter.kForgetPassword2Name,
                extra: state.email,
              );
            }
          },
        ),
        BlocListener<GoogleSignInCubit, GoogleSignInState>(
          listener: (context, state) {
            if (state is GoogleSignInFailure) {
              showFailureSnackBar(state.errMessage, context);
            }
            if (state is GoogleSignInSuccess) {
              GoRouter.of(context).pushNamed(AppRouter.kAppRootName);
            }
          },
        ),
      ],
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: CustomLoadingIndicator(),
            inAsyncCall: state is ForgetPasswordLoading ||
                context.watch<GoogleSignInCubit>().state
                    is GoogleSignInLoading,
            child: ForgetPasswordBody1(),
          );
        },
      ),
    );
  }
}
