import 'dart:io';

import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/create_post_form.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/create_post_view_body.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key, this.image});

  final File? image;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<CreatePostFormState> formKey =
        GlobalKey<CreatePostFormState>();
    return Scaffold(
      appBar: CustomAppBar2(
        title: "انشاء منشور",
        trailing: CustomButton(
          onPressed: () => formKey.currentState?.submit(),
          title: "نشر",
          textStyle: AppStyles.fontsBold14(
            context,
          ).copyWith(color: AppColors.whiteColor),
          borderRadius: 12,
          icon: Assets.iconsArrow,
          iconColor: AppColors.whiteColor,
          verPadding: 10,
          horPadding: 16,
          size: 12,
        ),
      ),
      body: CreatePostViewBody(formKey: formKey,image:image),
    );
  }
}
