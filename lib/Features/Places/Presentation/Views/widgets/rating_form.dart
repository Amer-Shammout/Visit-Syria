import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';
import 'package:visit_syria/Core/widgets/profile_avatar.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/custom_rating_bar.dart';

class RatingForm extends StatelessWidget {
  const RatingForm({
    super.key,
    this.padding = 16,
    this.boxShadow,
    this.hasBottomRadius = true,  this.userRate,  this.userComment, 
  });

  final double padding;
  final BoxShadow? boxShadow;
  final bool hasBottomRadius;
  final int? userRate;
  final String? userComment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: CustomCardBackground(
        hasBottomRadius: hasBottomRadius,
        boxShadow: boxShadow,
        padding: 24,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(),
                SizedBox(width: AppSpacing.s8),
                CustomRatingBar(initialRating: userRate?.toDouble() ?? 1,),
              ],
            ),
            SizedBox(height: AppSpacing.s12),
            CustomTextFormField(
              hint: "اوصف تجربتك (اختياري)",
              maxLines: 3,
              textInputAction: TextInputAction.done,
              initialValue: userComment,
            ),
            SizedBox(height: AppSpacing.s12),
            CustomButton(
              onPressed: () {},
              title: "مشاركة",
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.whiteColor),
              borderRadius: 16,
              icon: Assets.iconsArrow,
              iconColor: AppColors.whiteColor,
              verPadding: 12,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
