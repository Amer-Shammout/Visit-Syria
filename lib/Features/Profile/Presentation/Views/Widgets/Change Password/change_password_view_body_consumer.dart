import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/loading_dialog.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/change_password_cubit/change_password_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Change%20Password/change_password_view_body.dart';

class ChangePasswordBodyConsumer extends StatelessWidget {
  const ChangePasswordBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          GoRouter.of(context).pop();
        }
        if (state is ChangePasswordFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is ChangePasswordLoading) {
          showLoadingDialog(context);
        }
      },
      child: Center(child: ChangePasswordViewBody()),
    );
  }
}
