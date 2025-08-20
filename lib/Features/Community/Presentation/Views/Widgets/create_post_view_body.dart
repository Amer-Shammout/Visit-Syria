import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/avatar_and_name_and_history.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/create_post_cubit/create_post_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/create_post_cubit/create_post_state.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/create_post_form.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';

class CreatePostViewBody extends StatelessWidget {
  const CreatePostViewBody({super.key, required this.formKey, this.image});

  // ignore: library_private_types_in_public_api
  final GlobalKey<CreatePostFormState> formKey;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostCubit, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostFailure) {
          showFailureSnackBar(state.message, context);
        }
        if (state is CreatePostSuccess) {
          GoRouter.of(context).pop();
        }
        if (state is CreatePostLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => Center(child: CustomLoadingIndicator()),
          );
        } else {
          GoRouter.of(context).pop();
        }
      },
      child: ListView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
        physics: BouncingScrollPhysics(),
        children: [
          AvatarandNameandHistory(
            name: GetProfileCubit.userModel?.me?.profile?.firstName ?? "",
            date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
          ),
          SizedBox(height: AppSpacing.s24),
          CreatePostForm(key: formKey, image: image),
        ],
      ),
    );
  }
}
