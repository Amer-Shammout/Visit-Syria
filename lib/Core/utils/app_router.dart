import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/login_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/on_boarding_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/setting_info_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/sign_up_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/verification_view.dart';
import 'package:visit_syria/Features/Splash%20Screen/Presentation/Views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kSplashName = 'splash';
  static const kOnboardingName = 'onBoarding';
  static const kOnboardingView = '/onBoarding';
  static const kSignupView = '/signupView';
  static const kSignupName = 'signupView';
  static const kLoginView = '/loginView';
  static const kLoginName = 'loginView';
  static const kVerificationView = '/verificationView';
  static const kVerificationName = 'verificationView';
  static const kSettingInfoView = '/settingInfoView';
  static const kSettingInfoName = 'settingInfoView';
  static const kHomeView = '/homeView';
  static const kHomeName = 'homeView';

  static final router = GoRouter(
    // initialLocation: isAuth ? kAppRoot : kLetsGetStartedView,
    routes: [
      GoRoute(
        name: kSplashName,
        path: '/',
        pageBuilder:
            (context, state) => const MaterialPage(child: SplashView()),
      ),
      GoRoute(
        name: kOnboardingName,
        path: kOnboardingView,
        pageBuilder:
            (context, state) => const MaterialPage(child: OnboardingView()),
      ),
      GoRoute(
        name: kLoginName,
        path: kLoginView,
        pageBuilder: (context, state) => const MaterialPage(child: LoginView()),
      ),
      GoRoute(
        name: kSignupName,
        path: kSignupView,
        pageBuilder:
            (context, state) => const MaterialPage(child: SignUpView()),
      ),
      GoRoute(
        name: kVerificationName,
        path: kVerificationView,
        pageBuilder:
            (context, state) => const MaterialPage(child: VerificationView()),
      ),
      GoRoute(
        name: kSettingInfoName,
        path: kSettingInfoView,
        pageBuilder:
            (context, state) => const MaterialPage(child: SettingInfoView()),
      ),
    ],
  );
}
