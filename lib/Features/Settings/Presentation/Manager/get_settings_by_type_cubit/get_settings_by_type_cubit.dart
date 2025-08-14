import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Settings/Data/Repos/settings_repo.dart';
import 'package:visit_syria/Features/Settings/Presentation/Manager/get_settings_by_type_cubit/get_settings_by_type_state.dart';

class GetSettingsByTypeCubit extends Cubit<GetSettingsByTypeState> {
  final SettingsRepo _settingsRepo;
  GetSettingsByTypeCubit(this._settingsRepo) : super(GetSettingsByTypeInitial());

  Future<void> fetchSettings(String type, String category) async {
    emit(GetSettingsByTypeLoading());
    final result = await _settingsRepo.getSettingsByType(
      type: type,
      category: category,
    );
    result.fold(
      (failure) => emit(GetSettingsByTypeFailure(failure.errMessage)),
      (settings) => emit(GetSettingsByTypeSuccess(settings)),
    );
  }
}
