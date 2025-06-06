import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/widgets/custom_button.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/On%20Boarding/on_boarding_bottom_sheet.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/On%20Boarding/on_boarding_page_view.dart';

class OnboardingBody extends StatelessWidget {
  final PageController controller;
  final int currentPage;
  final List<Map<String, String>> onboardingData;
  final ValueChanged<int> onPageChanged;

  const OnboardingBody({
    super.key,
    required this.controller,
    required this.currentPage,
    required this.onboardingData,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnboardingPageView(
          controller: controller,
          onboardingData: onboardingData,
          onPageChanged: onPageChanged,
        ),
        Positioned(
          top: 115,
          left: 20,
          right: 20,
          child: Center(
            child: SvgPicture.asset(
              Assets.imagesLogoWhite,
              height: 75,
              width: 160,
            ),
          ),
        ),
        if (currentPage != onboardingData.length - 1)
          Positioned(
            top: 50,
            right: 16,
            child: CustomButton(
              onPressed:
                  () => GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.kLoginName),
              title: 'تخطي',
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.graySwatch[500]),
              verPadding: 8,
              horPadding: 24,
              strokeColor: AppColors.graySwatch[500]!,
              fillColor: Colors.transparent,
              borderRadius: 16,
            ),
          ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: OnboardingBottomSheet(
            currentPage: currentPage,
            totalPages: onboardingData.length,
            title: onboardingData[currentPage]['title']!,
            description: onboardingData[currentPage]['description']!,
            isLastPage: currentPage == onboardingData.length - 1,
            onNext:
                currentPage == onboardingData.length - 1
                    ? () {
                      GoRouter.of(
                        context,
                      ).pushReplacementNamed(AppRouter.kLoginName);
                    }
                    : nextPage,
          ),
        ),
      ],
    );
  }

  nextPage() {
    if (currentPage < onboardingData.length - 1) {
      controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // GoRouter.of(context).pushReplacementNamed(AppRouter.kLoginName);
    }
  }
}
