import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:visit_syria/Core/utils/assets.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      Assets.lottieLoading,
      width: 80,
      height: 80,
    );
  }
}
