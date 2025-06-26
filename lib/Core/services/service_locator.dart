import 'package:get_it/get_it.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}
