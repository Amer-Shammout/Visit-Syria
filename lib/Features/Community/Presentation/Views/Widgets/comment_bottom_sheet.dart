import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({
    super.key,
    this.onFieldSubmitted,
    required this.textEditingController,
  });

  final void Function(String)? onFieldSubmitted;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: double.infinity,

          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [Shadows.aiBootContainerShadow],
            color: AppColors.whiteColor,
          ),
          child: CustomTextFormField(
            controller: textEditingController,
            hint: "اكتب تعليق",
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 12),
                child: SvgPicture.asset(
                  Assets.iconsComment,
                  alignment: Alignment.center,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.graySwatch,
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
            validator: Validation.validateEmptyField,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: onFieldSubmitted,
          ),
        ),
      ],
    );
  }
}
