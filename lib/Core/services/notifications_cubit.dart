import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';

class NotificationCubit extends Cubit<bool> {
  NotificationCubit() : super(false);

  void showBadge() {
    Prefs.setBool(kHasBadge, true);
    emit(true);
  }

  void clearBadge() {
    Prefs.setBool(kHasBadge, false);
    emit(false);
  }
}
