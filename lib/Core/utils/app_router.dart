import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLetsGetStartedView = '/';
  static const kLetsGetStartedName = 'letsGetStartedView';
  static const kRegistrationView = '/registrationView';
  static const kRegistrationName = 'registrationView';
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
    
    ],
  );
}
