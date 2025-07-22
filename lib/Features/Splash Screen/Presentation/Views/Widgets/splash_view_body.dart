import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _navigated = false; // للتأكد أننا لا ننتقل أكثر من مرة

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        repeat: false,
        Assets.lottieArabicLogoWhite,
        width: 250,
        height: 250,
        fit: BoxFit.contain,
        onLoaded: (composition) {
          Future.delayed(composition.duration, () {
            if (!_navigated) {
              _navigated = true;
              GoRouter.of(
                context,
              ).pushReplacementNamed(AppRouter.kOnboardingName);
            }
          });
        },
      ),
    );
  }
}
