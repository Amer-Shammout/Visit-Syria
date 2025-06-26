import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Forget%20Password/forget_password_body_3.dart';

class ForgetPassword3ViewBodyConsumer extends StatelessWidget {
  const ForgetPassword3ViewBodyConsumer({
    super.key,
    required this.verificationModel,
  });

  final VerificationModel verificationModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is ResetPasswordSuccess) {
          GoRouter.of(context).goNamed(AppRouter.kLoginName);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CustomLoadingIndicator(),
          inAsyncCall: state is ResetPasswordLoading,
          child: ForgetPasswordBody3(verificationModel: verificationModel),
        );
      },
    );
  }
}
