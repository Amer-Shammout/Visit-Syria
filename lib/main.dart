import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:visit_syria/Core/services/custom_bloc_observer.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/styles/app_theme.dart';
import 'package:visit_syria/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  // Prefs.removePref(kToken);
  Bloc.observer = CustomBlocObserver();

  setupGetit();

  runApp(const VisitSyriaApp());
}

class VisitSyriaApp extends StatelessWidget {
  const VisitSyriaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
