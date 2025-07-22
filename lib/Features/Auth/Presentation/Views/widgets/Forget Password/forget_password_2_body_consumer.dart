import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_body_2.dart';

class ForgetPassword2ViewBodyConsumer extends StatelessWidget {
  const ForgetPassword2ViewBodyConsumer({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
      listener: (context, state) {
        if (state is VerifyCodeFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is VerifyCodeSuccess) {
          GoRouter.of(context).pushNamed(
            AppRouter.kForgetPassword3Name,
            extra: state.verificationModel,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CustomLoadingIndicator(),
          inAsyncCall: state is VerifyCodeLoading,
          child: ForgetPasswordBody2(email: email),
        );
      },
    );
  }
}
