import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Profile/Data/Models/saved_item_model.dart';

class SavedItemsCard extends StatelessWidget {
  const SavedItemsCard({super.key, required this.savedItemModel});

  final SavedItemModel savedItemModel;

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            savedItemModel.icon,
            width: 48,
            height: 48,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcATop),
          ),
          SizedBox(height: AppSpacing.s8),
          Text(
            savedItemModel.title,
            style: AppStyles.fontsBold16(
              context,
            ).copyWith(color: AppColors.titleTextColor),
          ),
        ],
      ),
    );
  }
}
