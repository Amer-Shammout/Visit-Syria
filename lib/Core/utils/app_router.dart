import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/data/models/city_model.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/all_similar_blogs_view.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/blog_details_view.dart';
import 'package:visit_syria/Features/App%20Root/Presentation/Views/app_root_.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/login_cubit/login_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/register_cubit/register_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/resend_code_cubit/resend_code_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/set_preferences_cubit/set_preferences_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/set_profile_cubit/set_profile_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/forget_password_view_1.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/forget_password_view_2.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/forget_password_view_3.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/login_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/on_boarding_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/preferences_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/setting_info_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/sign_up_view.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/verification_view.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/all_comments_view.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/create_post_view.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/all_events_view.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/event_details_view.dart';
import 'package:visit_syria/Features/Events/Presentation/manager/get_all_events_cubit/get_all_events_cubit.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Events/data/Repos/events_repo_impl.dart';
import 'package:visit_syria/Features/Home/Data/Repos/home_repo_impl.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/weather/get_weather_for_week_cubit/get_weather_for_week_cubit.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/weather/get_weather_today_cubit/get_weather_today_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/all_comments_and_rating_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/all_places_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/city_details_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/place_details_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/my_posts_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/my_trips_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/personal_info_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/profile_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/saved_blogs_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/saved_events_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/saved_hotels_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/saved_items_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/saved_places_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/saved_posts_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/saved_resturants_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/saved_trips_view.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/hotel_and_resturants_details_view.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/hotels_and_resturants_view.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/similar_hotels_or_resturants_view.dart';
import 'package:visit_syria/Features/Search/Presentation/Views/search_view.dart';
import 'package:visit_syria/Features/Settings/Presentation/Views/settings_view.dart';
import 'package:visit_syria/Features/Splash%20Screen/Presentation/Views/splash_view.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/tourism_companies_view.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/tourism_company_details_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/all_offers_view.dart';
import 'package:visit_syria/Features/Weather/Presentation/views/weather_view_builder.dart';

abstract class AppRouter {
  static const kSplashView = '/splash';
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
  static const kAllPlacesView = '/allPlacesView';
  static const kAllPlacesName = 'allPlacesView';
  static const kCityDetailsView = '/cityDetailsView';
  static const kCityDetailsName = 'cityDetailsView';
  static const kPlaceDetailsView = '/placeDetailsView';
  static const kPlaceDetailsName = 'placeDetailsView';
  static const kAllCommentsAndRatingView = '/allCommentsAndRatingView';
  static const kAllCommentsAndRatingName = 'allCommentsAndRatingView';
  static const kCreatePostView = '/createPostView';
  static const kCreatePostName = 'createPostView';
  static const kAllCommentsView = '/allCommentsView';
  static const kAllCommentsName = 'allCommentsView';
  static const kBlogDetailsView = '/blogDetailsView';
  static const kBlogDetailsName = 'blogDetailsView';
  static const kSimilarBlogsView = '/similarBlogsView';
  static const kSimilarBlogsName = 'similarBlogsView';
  static const kHotelsAndResturantsView = '/hotelsAndResturantsView';
  static const kHotelsAndResturantsName = 'hotelsAndResturantsView';
  static const kHotelsAndResturantsDetailsView =
      '/hotelsAndResturantsDetailsView';
  static const kHotelsAndResturantsDetailsName =
      'hotelsAndResturantsDetailsView';
  static const kSimialarHotelsOrResturantsView =
      '/simialarHotelsOrResturantsView';
  static const kSimialarHotelsOrResturantsName =
      'simialarHotelsOrResturantsView';
  static const kTourismCompaniesView = '/tourismCompaniesView';
  static const kTourismCompanieName = 'tourismCompaniesView';
  static const kTourismCompanyDetailsView = '/tourismCompanyDetailsView';
  static const kTourismCompanyDetailsName = 'tourismCompanyDetailsView';
  static const kProfileView = '/profileView';
  static const kProfileName = 'profileView';
  static const kPersonalInfoView = '/personalInfoView';
  static const kPersonalInfoName = 'personalInfoView';
  static const kMyTripsView = '/myTrips';
  static const kMyTripsName = 'myTrips';
  static const kMyPostsView = '/myPosts';
  static const kMyPostsName = 'myPosts';
  static const kSavedItemsView = '/savedItems';
  static const kSavedItemsName = 'savedItems';
  static const kSavedEventsView = '/savedEvents';
  static const kSavedEventsName = 'savedEvents';
  static const kSavedTripsView = '/savedTrips';
  static const kSavedTripsName = 'savedTrips';
  static const kSavedPlacesView = '/savedPlaces';
  static const kSavedPlacesName = 'savedPlaces';
  static const kSavedResturantsView = '/savedResturants';
  static const kSavedResturantsName = 'savedResturants';
  static const kSavedHotelsView = '/savedHotels';
  static const kSavedHotelsName = 'savedHotels';
  static const kSavedBlogsView = '/savedBlogs';
  static const kSavedBlogsName = 'savedBlogs';
  static const kSavedPostsView = '/savedPosts';
  static const kSavedPostsName = 'savedPosts';
  static const kSettingsView = '/settings';
  static const kSettingsName = 'settings';
  static const kSearchView = '/search';
  static const kSearchName = 'search';

  static bool get isAuth => Prefs.getString(kToken) != '';

  static final router = GoRouter(
    initialLocation: isAuth ? kAppRootView : kSplashView,
    routes: [
      GoRoute(
        name: kSplashName,
        path: kSplashView,
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
        pageBuilder:
            (context, state) => MaterialPage(
              child: MultiBlocProvider(
                providers: [
                   BlocProvider(
                    create:
                        (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
                  ),
                   BlocProvider(
                    create:
                        (context) =>
                            GoogleSignInCubit(getIt.get<AuthRepoImpl>()),
                  ),
                ],
                child: LoginView(),
              ),
            ),
      ),
      GoRoute(
        name: kSignupName,
        path: kSignupView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
                  ),
                   BlocProvider(
                    create:
                        (context) =>
                            GoogleSignInCubit(getIt.get<AuthRepoImpl>()),
                  ),
                ],
                child: SignUpView(),
              ),
            ),
      ),
      GoRoute(
        name: kVerificationName,
        path: kVerificationView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            VerifyEmailCubit(getIt.get<AuthRepoImpl>()),
                  ),
                  BlocProvider(
                    create:
                        (context) => ResendCodeCubit(getIt.get<AuthRepoImpl>()),
                  ),
                ],
                child: VerificationView(
                  authRequestModel: state.extra as AuthRequestModel,
                ),
              ),
            ),
      ),
      GoRoute(
        name: kSettingInfoName,
        path: kSettingInfoView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: BlocProvider(
                create: (context) => SetProfileCubit(getIt.get<AuthRepoImpl>()),
                child: SettingInfoView(),
              ),
            ),
      ),
      GoRoute(
        name: kPreferencesName,
        path: kPreferencesView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: BlocProvider(
                create:
                    (context) => SetPreferencesCubit(getIt.get<AuthRepoImpl>()),
                child: PreferencesView(),
              ),
            ),
      ),
      GoRoute(
        name: kForgetPassword1Name,
        path: kForgetPassword1View,
        pageBuilder:
            (context, state) => MaterialPage(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            ForgetPasswordCubit(getIt.get<AuthRepoImpl>()),
                  ),
                  BlocProvider(
                    create:
                        (context) =>
                            GoogleSignInCubit(getIt.get<AuthRepoImpl>()),
                  ),
                ],
                child: ForgetPasswordView1(),
              ),
            ),
      ),
      GoRoute(
        name: kForgetPassword2Name,
        path: kForgetPassword2View,
        pageBuilder:
            (context, state) => MaterialPage(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) => VerifyCodeCubit(getIt.get<AuthRepoImpl>()),
                  ),
                  BlocProvider(
                    create:
                        (context) => ResendCodeCubit(getIt.get<AuthRepoImpl>()),
                  ),
                ],
                child: ForgetPasswordView2(email: state.extra as String),
              ),
            ),
      ),
      GoRoute(
        name: kForgetPassword3Name,
        path: kForgetPassword3View,
        pageBuilder:
            (context, state) => MaterialPage(
              child: BlocProvider(
                create:
                    (context) => ResetPasswordCubit(getIt.get<AuthRepoImpl>()),
                child: ForgetPasswordView3(
                  verificationModel: state.extra as VerificationModel,
                ),
              ),
            ),
      ),
      GoRoute(
        name: kAppRootName,
        path: kAppRootView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: BlocProvider(
                create:
                    (context) =>
                        GetWeatherTodayCubit(getIt.get<HomeRepoImpl>())
                          ..getWeatherToday(),
                child: AppRootView(),
              ),
            ),
      ),
      GoRoute(
        name: kWeatherName,
        path: kWeatherView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: BlocProvider(
                create:
                    (context) =>
                        GetWeatherForWeekCubit(getIt.get<HomeRepoImpl>()),
                child: WeatherView(cityName: state.extra as String),
              ),
            ),
      ),
      GoRoute(
        name: kAllEventsName,
        path: kAllEventsView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: BlocProvider(
                create:
                    (context) =>
                        GetAllEventsCubit(getIt.get<EventsRepoImpl>())
                          ..getAllEvents(),
                child: AllEventsView(),
              ),
            ),
      ),
      GoRoute(
        name: kEventDetailsName,
        path: kEventDetailsView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: EventDetailsView(event: state.extra as EventModel),
            ),
      ),
      GoRoute(
        name: kAllOffersName,
        path: kAllOffersView,
        pageBuilder:
            (context, state) => const MaterialPage(child: AllOffersView()),
      ),
      GoRoute(
        name: kAllPlacesName,
        path: kAllPlacesView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: AllPlacesView(title: state.extra as String),
            ),
      ),
      GoRoute(
        name: kCityDetailsName,
        path: kCityDetailsView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: CityDetailsView(cityModel: state.extra as CityModel),
            ),
      ),
      GoRoute(
        name: kPlaceDetailsName,
        path: kPlaceDetailsView,
        pageBuilder:
            (context, state) => MaterialPage(child: PlaceDetailsView()),
      ),
      GoRoute(
        name: kAllCommentsAndRatingName,
        path: kAllCommentsAndRatingView,
        pageBuilder:
            (context, state) => MaterialPage(child: AllCommentsAndRatingView()),
      ),
      GoRoute(
        name: kCreatePostName,
        path: kCreatePostView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: CreatePostView(image: state.extra as File?),
            ),
      ),
      GoRoute(
        name: kAllCommentsName,
        path: kAllCommentsView,
        pageBuilder: (context, state) => MaterialPage(child: AllCommentsView()),
      ),
      GoRoute(
        name: kBlogDetailsName,
        path: kBlogDetailsView,
        pageBuilder: (context, state) => MaterialPage(child: BlogDetailsView()),
      ),
      GoRoute(
        name: kSimilarBlogsName,
        path: kSimilarBlogsView,
        pageBuilder:
            (context, state) => MaterialPage(child: AllSimilarBlogsView()),
      ),
      GoRoute(
        name: kHotelsAndResturantsName,
        path: kHotelsAndResturantsView,
        pageBuilder:
            (context, state) => MaterialPage(child: HotelsAndResturantsView()),
      ),
      GoRoute(
        name: kHotelsAndResturantsDetailsName,
        path: kHotelsAndResturantsDetailsView,
        pageBuilder:
            (context, state) =>
                MaterialPage(child: HotelAndResturantsDetailsView()),
      ),
      GoRoute(
        name: kSimialarHotelsOrResturantsName,
        path: kSimialarHotelsOrResturantsView,
        pageBuilder:
            (context, state) => MaterialPage(
              child: SimilarHotelsOrResturantsView(
                title: state.extra as String,
              ),
            ),
      ),
      GoRoute(
        name: kTourismCompanieName,
        path: kTourismCompaniesView,
        pageBuilder:
            (context, state) => MaterialPage(child: TourismCompaniesView()),
      ),
      GoRoute(
        name: kTourismCompanyDetailsName,
        path: kTourismCompanyDetailsView,
        pageBuilder:
            (context, state) =>
                MaterialPage(child: TourismCompanyDetailsView()),
      ),
      GoRoute(
        name: kProfileName,
        path: kProfileView,
        pageBuilder: (context, state) => MaterialPage(child: ProfileView()),
      ),
      GoRoute(
        name: kPersonalInfoName,
        path: kPersonalInfoView,
        pageBuilder:
            (context, state) => MaterialPage(child: PersonalInfoView()),
      ),
      GoRoute(
        name: kMyTripsName,
        path: kMyTripsView,
        pageBuilder: (context, state) => MaterialPage(child: MyTripsView()),
      ),
      GoRoute(
        name: kMyPostsName,
        path: kMyPostsView,
        pageBuilder: (context, state) => MaterialPage(child: MyPostsView()),
      ),
      GoRoute(
        name: kSavedItemsName,
        path: kSavedItemsView,
        pageBuilder: (context, state) => MaterialPage(child: SavedItemsView()),
      ),
      GoRoute(
        name: kSavedEventsName,
        path: kSavedEventsView,
        pageBuilder: (context, state) => MaterialPage(child: SavedEventsView()),
      ),
      GoRoute(
        name: kSavedTripsName,
        path: kSavedTripsView,
        pageBuilder: (context, state) => MaterialPage(child: SavedTripsView()),
      ),
      GoRoute(
        name: kSavedPlacesName,
        path: kSavedPlacesView,
        pageBuilder: (context, state) => MaterialPage(child: SavedPlacesView()),
      ),
      GoRoute(
        name: kSavedResturantsName,
        path: kSavedResturantsView,
        pageBuilder:
            (context, state) => MaterialPage(child: SavedResturantsView()),
      ),
      GoRoute(
        name: kSavedHotelsName,
        path: kSavedHotelsView,
        pageBuilder: (context, state) => MaterialPage(child: SavedHotelsView()),
      ),
      GoRoute(
        name: kSavedBlogsName,
        path: kSavedBlogsView,
        pageBuilder: (context, state) => MaterialPage(child: SavedBlogsView()),
      ),
      GoRoute(
        name: kSavedPostsName,
        path: kSavedPostsView,
        pageBuilder: (context, state) => MaterialPage(child: SavedPostsView()),
      ),
      GoRoute(
        name: kSettingsName,
        path: kSettingsView,
        pageBuilder: (context, state) => MaterialPage(child: SettingsView()),
      ),
      GoRoute(
        name: kSearchName,
        path: kSearchView,
        pageBuilder: (context, state) => MaterialPage(child: SearchView()),
      ),
    ],
  );
}
