import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:visit_syria/Core/services/custom_bloc_observer.dart';
import 'package:visit_syria/Core/services/firebase_notification.dart';
import 'package:visit_syria/Core/services/notifications_cubit.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_theme.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Repos/about_syria_repo_impl.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_articles_by_tag_cubit/get_articles_by_tag_cubit.dart';
import 'package:visit_syria/Features/Community/Data/Repos/community_repo_impl.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_all_approved_posts_by_tag_cubit/get_all_approved_posts_by_tag_cubit.dart';
import 'package:visit_syria/Features/Home/Data/Repos/home_repo_impl.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/home_cubit/home_cubit.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/profile_repo_impl.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:visit_syria/firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  // Prefs.removePref(kToken);
  // Prefs.setString(
  //   kToken,
  //   "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvdmVyaWZ5RW1haWwiLCJpYXQiOjE3NTUzODIxNDcsIm5iZiI6MTc1NTM4MjE0NywianRpIjoibm80Zmo5Z0Z2aWZrb2RNVSIsInN1YiI6IjYiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.mChLNT-xlbHtlJLZcpfMDnb5YRIORg7TPTr1uGa1cm0",
  // );
  WidgetsBinding.instance.addPostFrameCallback((_) {
    FirebaseNotification.getFCMToken();
  });
  Stripe.publishableKey =
      'pk_test_51RzhGTFOUKBGQ0NC3H0JgGkkaSbf7hy0jwbxdtSKa2eVERw6wF4fg1SjXYbM1556OI8FUeWItAV1gDjIEUltktFe00cjaJ0qAn';

  await Stripe.instance.applySettings();
  Bloc.observer = CustomBlocObserver();

  setupGetit();

  runApp(
    BlocProvider(create: (context) => NotificationCubit(), child: VisitSyriaApp()),
  );
}

class VisitSyriaApp extends StatelessWidget {
  const VisitSyriaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  GetAllApprovedPostsByTagCubit(getIt.get<CommunityRepoImpl>())
                    ..fetchPosts("الكل"),
        ),
        BlocProvider(
          create:
              (context) =>
                  GetProfileCubit(getIt.get<ProfileRepoImpl>())..getProfile(),
        ),
        BlocProvider(
          create: (context) => SetSaveCubit(getIt.get<CommonRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => DeleteSaveCubit(getIt.get<CommonRepoImpl>()),
        ),
        BlocProvider(
          create:
              (context) =>
                  HomeCubit(getIt.get<HomeRepoImpl>())..fetchHomeData(),
        ),

        BlocProvider(
          create:
              (context) => GetArticlesByTagCubit(
                getIt.get<AboutSyriaRepoImpl>()..getArticlesByTag(tag: "الكل"),
              ),
        ),
      ],

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        supportedLocales: [Locale('ar'), Locale('en')],
        locale: Locale('ar'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
