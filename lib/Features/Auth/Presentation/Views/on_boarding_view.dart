import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/On%20Boarding/on_boarding_view_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": Assets.imagesOnBoarding1,
      "title": "أهلاً بك في لفّة بسوريا",
      "description":
          "اكتشف جمال سوريا بعيون جديدة و تجارب مميزة. من أزقة الشام القديمة إلى أسواق حلب العريقة و سحر الطبيعة في الساحل، نأخذك في رحلة لا تُنسى !",
    },
    {
      "image": Assets.imagesOnBoarding2,
      "title": "التخطيط السهل للرحلات",
      "description":
          "احصل على تجربة سفر متكاملة.حيث يمكنك حجز تذاكر طيران، استخراح الفيزا الإلكترونية، و استكشاف الباقات السياحية المتنوعة. ",
    },
    {
      "image": Assets.imagesOnBoarding3,
      "title": "مجتمع حي و تجربة ذكية",
      "description":
          "انضم إلى مجتمع سياحي تفاعلي يشاركك التجارب و الرحلات، و استفد من ميزات AI التي تقترح لك الوجهات و الأنشطة و المزيد من الميزات التي تجعل تجربتك مميزة !",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBody(
        controller: _pageController,
        currentPage: currentPage,
        onboardingData: onboardingData,
        onPageChanged: (index) => setState(() => currentPage = index),
      ),
    );
  }
}
