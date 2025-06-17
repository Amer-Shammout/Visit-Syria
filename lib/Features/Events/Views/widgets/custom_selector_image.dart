import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class CustomSelectorImage extends StatelessWidget {
  const CustomSelectorImage({
    super.key,
    required this.isSelected,
    required this.image,
  });

  final bool isSelected;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          height: 86,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInCubic,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.black38 : null,
            border:
                isSelected
                    ? Border.all(color: AppColors.primary, width: 3)
                    : null,
          ),
        ),
        isSelected
            ? SvgPicture.asset(Assets.iconsCheckCircle, width: 24, height: 24)
            : SizedBox.shrink(),
      ],
    );
  }
}
