import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Verification/verification_view_body.dart';

class VerificationViewBodyConsumer extends StatelessWidget {
  const VerificationViewBodyConsumer({super.key, required this.authModel});

  final AuthRequestModel authModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) {
        if (state is VerifyEmailFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is VerifyEmailSuccess) {
          GoRouter.of(context).pushNamed(AppRouter.kSettingInfoName);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CustomLoadingIndicator(),
          inAsyncCall: state is VerifyEmailLoading,
          child: VerificationViewBody(authModel: authModel),
        );
      },
    );
  }
}
