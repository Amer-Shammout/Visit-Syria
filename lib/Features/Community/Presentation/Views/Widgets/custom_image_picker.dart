import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key, this.onImageSelected});

  final void Function(File?)? onImageSelected;

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
      widget.onImageSelected?.call(_image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.graySwatch[50],
          image:
              _image != null
                  ? DecorationImage(
                    image: FileImage(_image!),
                    fit: BoxFit.cover,
                  )
                  : null,
        ),
        child:
            _image == null
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.iconsUploadImage,
                      width: 32,
                      height: 32,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcATop,
                      ),
                    ),
                    SizedBox(height: AppSpacing.s8),
                    Text(
                      "تحميل صورة",
                      style: AppStyles.fontsBold16(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                    SizedBox(height: AppSpacing.s4),
                    Text(
                      "(اختياري)",
                      style: AppStyles.fontsRegular14(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                  ],
                )
                : SizedBox.shrink(),
      ),
    );
  }
}
