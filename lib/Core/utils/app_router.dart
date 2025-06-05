import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/on_boarding_view.dart';
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
  static const kVerificationView = '/verificationView/:phoneNumber';
  static const kVerificationName = 'verificationView';
  static const kSettingInfoView = '/settingInfoView';
  static const kSettingInfoName = 'settingInfoView';
  static const kHomeView = '/homeView';
  static const kHomeName = 'homeView';
  static const kAppRoot = '/appRoot';
  static const kAppRootName = 'appRoot';
  static const kStoreDetailsView = '/storeDetails';
  static const kStoreDetailsName = 'storeDetails';
  static const kProfileView = '/profileView';
  static const kProfileName = 'profileView';
  static const kSearchView = '/searchView';
  static const kSearchName = 'searchView';
  static const kProductDetailsView = '/productDetailsView';
  static const kProductDetailsName = 'productDetailsView';
  static const kCartView = '/CartView';
  static const kCartName = 'CartView';
  static const kAllStoresView = '/allStoresView';
  static const kAllStoresName = 'allStoresView';
  static const kAllProductsView = '/allProductsView';
  static const kAllProductsName = 'allProductsView';
  static const kNotificationsView = '/notificationsView';
  static const kNotificationsName = 'notificationsView';
  static const kEditOrderView = '/editOrderView';
  static const kEditOrderName = 'editOrderView';

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
        pageBuilder: (context, state) => const MaterialPage(child: Scaffold()),
      ),
    ],
  );
}
