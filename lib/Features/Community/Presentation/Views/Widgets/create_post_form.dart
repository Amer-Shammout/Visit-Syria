import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/custom_image_picker.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/select_tags_section.dart';

class CreatePostForm extends StatefulWidget {
  const CreatePostForm({super.key, this.image});

  final File? image;

  @override
  State<CreatePostForm> createState() => CreatePostFormState();
}

class CreatePostFormState extends State<CreatePostForm> {
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  File? image;
  List<String> selectedTags = [];
  String? postText;

  @override
  void initState() {
    image = widget.image;
    super.initState();
  }

  void toggleSelection(String option) {
    setState(() {
      if (selectedTags.contains(option)) {
        selectedTags.remove(option);
        log("${image?.path} \n $selectedTags ");
      } else {
        if (selectedTags.length < 10) {
          selectedTags.add(option);
        }
      }
    });
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      log("message");
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
        log("message");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _isAutoValidate,
      child: Column(
        children: [
          CustomImagePicker(
            image: image,
            onImageSelected:
                (image) => setState(() {
                  this.image = image;
                }),
          ),
          SizedBox(height: AppSpacing.s24),
          CustomTextFormField(
            hint: "بمَ تفكّر؟",
            maxLines: 8,
            validator: Validation.validateEmptyField,
            textInputAction: TextInputAction.newline,
            onSaved: (text) => postText = text,
          ),
          SizedBox(height: AppSpacing.s24),
          SelectTagsSection(
            onOptionToggle: toggleSelection,
            selectedTags: selectedTags,
          ),
        ],
      ),
    );
  }
}
