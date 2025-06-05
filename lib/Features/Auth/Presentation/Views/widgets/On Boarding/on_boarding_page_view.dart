import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;
  final List<Map<String, String>> onboardingData;
  final ValueChanged<int> onPageChanged;

  const OnboardingPageView({
    super.key,
    required this.controller,
    required this.onboardingData,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: onboardingData.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return Image.asset(onboardingData[index]['image']!, fit: BoxFit.cover);
      },
    );
  }
}
