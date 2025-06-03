
import 'package:get_it/get_it.dart';
import 'package:visit_syria/Core/network/dio_client.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DioClient>(DioClient());
  
}
