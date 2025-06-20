import 'dart:io';

import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/avatar_and_name_and_history.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/create_post_form.dart';

class CreatePostViewBody extends StatelessWidget {
  const CreatePostViewBody({super.key, required this.formKey, this.image});

  // ignore: library_private_types_in_public_api
  final GlobalKey<CreatePostFormState> formKey;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
      physics: BouncingScrollPhysics(),
      children: [
        AvatarandNameandHistory(),
        SizedBox(height: AppSpacing.s24),
        CreatePostForm(key: formKey,image:image),
      ],
    );
  }
}
