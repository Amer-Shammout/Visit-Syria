import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalDots;

  const DotsIndicator({
    super.key,
    required this.currentIndex,
    required this.totalDots,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 18 : 6,
          height: 6,
          decoration: BoxDecoration(
            color:
                currentIndex == index
                    ? AppColors.primarySwatch[50]
                    : AppColors.primarySwatch[50]!.withOpacity(.3),
            borderRadius: BorderRadius.circular(360),
          ),
        ),
      ),
    );
  }
}
