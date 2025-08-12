import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/login_cubit/login_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Login/login_view_body.dart';

class LoginViewBodyConsumer extends StatelessWidget {
  const LoginViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              showFailureSnackBar(state.errMessage, context);
            }
            if (state is LoginSuccess) {
              GoRouter.of(context).pushNamed(AppRouter.kAppRootName);
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
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: CustomLoadingIndicator(),
            inAsyncCall:
                state is LoginLoading ||
                context.watch<GoogleSignInCubit>().state is GoogleSignInLoading,
            child: LoginViewBody(),
          );
        },
      ),
    );
  }
}
