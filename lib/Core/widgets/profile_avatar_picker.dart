import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class ProfileAvatarPicker extends StatefulWidget {
  final void Function(File?)? onImageSelected;

  final String? userImage;

  const ProfileAvatarPicker({super.key, this.onImageSelected, this.userImage});

  @override
  State<ProfileAvatarPicker> createState() => _ProfileAvatarPickerState();
}

class _ProfileAvatarPickerState extends State<ProfileAvatarPicker> {
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
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[200],
            backgroundImage:
                _image != null
                    ? FileImage(_image!)
                    : (widget.userImage != null
                        ? AssetImage(widget.userImage!)
                        : null),
            child:
                _image == null && widget.userImage == null
                    ? SvgPicture.asset(
                      Assets.iconsUser,
                      height: 48,
                      width: 48,
                      colorFilter: ColorFilter.mode(
                        AppColors.graySwatch,
                        BlendMode.srcATop,
                      ),
                    )
                    : null,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              Assets.iconsUpload,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                AppColors.whiteColor,
                BlendMode.srcATop,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
