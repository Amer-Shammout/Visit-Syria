import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Features/App%20Root/Presentation/Views/app_root_.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/forget_password_view_1.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/forget_password_view_2.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/forget_password_view_3.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/login_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/on_boarding_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/preferences_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/setting_info_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/sign_up_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/verification_view.dart';
import 'package:visit_syria/Features/Events/Views/all_events_view.dart';
import 'package:visit_syria/Features/Events/Views/event_details_view.dart';
import 'package:visit_syria/Features/Splash%20Screen/Presentation/Views/splash_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/all_offers_view.dart';
import 'package:visit_syria/Features/Weather/Presentation/views/weather_view.dart';

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
  static const kPreferencesView = '/preferencesView';
  static const kPreferencesName = 'preferencesView';
  static const kForgetPassword1View = '/forgetPassword1View';
  static const kForgetPassword1Name = 'forgetPassword1View';
  static const kForgetPassword2View = '/forgetPassword2View';
  static const kForgetPassword2Name = 'forgetPassword2View';
  static const kForgetPassword3View = '/forgetPassword3View';
  static const kForgetPassword3Name = 'forgetPassword3View';
  static const kAppRootName = 'appRoot';
  static const kAppRootView = '/appRoot';
  static const kHomeView = '/homeView';
  static const kHomeName = 'homeView';
  static const kWeatherView = '/weatherView';
  static const kWeatherName = 'weatherView';
  static const kAllEventsView = '/allEventsView';
  static const kAllEventsName = 'allEventsView';
  static const kEventDetailsView = '/eventView';
  static const kEventDetailsName = 'eventDetailsView';
  static const kAllOffersView = '/allOffersView';
  static const kAllOffersName = 'allOffersView';

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
      GoRoute(
        name: kPreferencesName,
        path: kPreferencesView,
        pageBuilder:
            (context, state) => const MaterialPage(child: PreferencesView()),
      ),
      GoRoute(
        name: kForgetPassword1Name,
        path: kForgetPassword1View,
        pageBuilder:
            (context, state) =>
                const MaterialPage(child: ForgetPasswordView1()),
      ),
      GoRoute(
        name: kForgetPassword2Name,
        path: kForgetPassword2View,
        pageBuilder:
            (context, state) =>
                const MaterialPage(child: ForgetPasswordView2()),
      ),
      GoRoute(
        name: kForgetPassword3Name,
        path: kForgetPassword3View,
        pageBuilder:
            (context, state) =>
                const MaterialPage(child: ForgetPasswordView3()),
      ),
      GoRoute(
        name: kAppRootName,
        path: kAppRootView,
        pageBuilder:
            (context, state) => const MaterialPage(child: AppRootView()),
      ),
      GoRoute(
        name: kWeatherName,
        path: kWeatherView,
        pageBuilder:
            (context, state) => const MaterialPage(child: WeatherView()),
      ),
      GoRoute(
        name: kAllEventsName,
        path: kAllEventsView,
        pageBuilder:
            (context, state) => const MaterialPage(child: AllEventsView()),
      ),
      GoRoute(
        name: kEventDetailsName,
        path: kEventDetailsView,
        pageBuilder:
            (context, state) => const MaterialPage(child: EventDetailsView()),
      ),
      GoRoute(
        name: kAllOffersName,
        path: kAllOffersView,
        pageBuilder:
            (context, state) => const MaterialPage(child: AllOffersView()),
      ),
    ],
  );
}
