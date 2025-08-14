import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Settings/Data/Models/settings_model.dart';

abstract class GetSettingsByTypeState extends Equatable {
  const GetSettingsByTypeState();

  @override
  List<Object?> get props => [];
}

class GetSettingsByTypeInitial extends GetSettingsByTypeState {}

class GetSettingsByTypeLoading extends GetSettingsByTypeState {}

class GetSettingsByTypeSuccess extends GetSettingsByTypeState {
  final List<SettingsModel> settings;
  const GetSettingsByTypeSuccess(this.settings);

  @override
  List<Object?> get props => [settings];
}

class GetSettingsByTypeFailure extends GetSettingsByTypeState {
  final String message;
  const GetSettingsByTypeFailure(this.message);

  @override
  List<Object?> get props => [message];
}
