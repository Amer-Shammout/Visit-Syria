import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/on_boarding_constants.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/widgets/custom_button.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/On%20Boarding/on_boarding_bottom_sheet.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/On%20Boarding/on_boarding_page_view.dart';

class OnboardingBody extends StatefulWidget {
  // final PageController controller;
  // final int currentPage;
  // final List<Map<String, String>> onboardingData;
  // final ValueChanged<int> onPageChanged;

  const OnboardingBody({
    super.key,
    // required this.controller,
    // required this.currentPage,
    // required this.onboardingData,
    // required this.onPageChanged,
  });

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnboardingPageView(
          controller: pageController,
          onboardingData: kOnboardingData,
          onPageChanged: (index) => setState(() => currentPage = index),
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
        if (currentPage != kOnboardingData.length - 1)
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
              shadow: null,
            ),
          ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: OnboardingBottomSheet(
            currentPage: currentPage,
            totalPages: kOnboardingData.length,
            title: kOnboardingData[currentPage]['title']!,
            description: kOnboardingData[currentPage]['description']!,
            isLastPage: currentPage == kOnboardingData.length - 1,
            onNext:
                currentPage == kOnboardingData.length - 1
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
    if (currentPage < kOnboardingData.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // GoRouter.of(context).pushReplacementNamed(AppRouter.kLoginName);
    }
  }
}
