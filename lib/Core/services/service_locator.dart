import 'package:get_it/get_it.dart';
import 'package:visit_syria/Core/data/repos/common_repo_impl.dart';
import 'package:visit_syria/Features/Notifications/Data/repos/notifications_repo_impl.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Features/AI%20Assistant/Data/Repos/ai_repo_impl.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Repos/about_syria_repo_impl.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:visit_syria/Features/Community/Data/Repos/community_repo_impl.dart';
import 'package:visit_syria/Features/Events/data/Repos/events_repo_impl.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Repos/flights_repo_impl.dart';
import 'package:visit_syria/Features/Home/Data/Repos/home_repo_impl.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/saves_repo_impl.dart';
import 'package:visit_syria/Features/Reservation/Data/Repos/reservation_repo_impl.dart';
import 'package:visit_syria/Features/Search/Data/Repos/search_repo_impl.dart';
import 'package:visit_syria/Features/Settings/Data/Repos/settings_repo_impl.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Repos/companies_repo_impl.dart';
import 'package:visit_syria/Features/Trips/Data/Repos/trip_repo_impl.dart';
import 'package:visit_syria/Features/Places/Data/Repos/places_repo_impl.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/profile_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<EventsRepoImpl>(EventsRepoImpl());
  getIt.registerSingleton<TripRepoImpl>(TripRepoImpl());
  getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl());
  getIt.registerSingleton<PlacesRepoImpl>(PlacesRepoImpl());
  getIt.registerSingleton<SettingsRepoImpl>(SettingsRepoImpl());
  getIt.registerSingleton<AboutSyriaRepoImpl>(AboutSyriaRepoImpl());
  getIt.registerSingleton<FlightsRepoImpl>(FlightsRepoImpl());
  getIt.registerSingleton<CommonRepoImpl>(CommonRepoImpl());
  getIt.registerSingleton<CommunityRepoImpl>(CommunityRepoImpl());
  getIt.registerSingleton<ReservationRepoImpl>(ReservationRepoImpl());
  getIt.registerSingleton<CompaniesRepoImpl>(CompaniesRepoImpl());
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
  getIt.registerSingleton<AIRepoImpl>(AIRepoImpl());
  getIt.registerSingleton<MySavesRepoImpl>(MySavesRepoImpl());
  getIt.registerSingleton<NotificationsRepoImpl>(NotificationsRepoImpl());
}
