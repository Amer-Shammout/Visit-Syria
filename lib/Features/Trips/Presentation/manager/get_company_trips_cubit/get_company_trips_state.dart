part of 'get_company_trips_cubit.dart';

sealed class GetCompanyTripsState extends Equatable {
  const GetCompanyTripsState();

  @override
  List<Object> get props => [];
}

final class GetCompanyTripsInitial extends GetCompanyTripsState {}

final class GetCompanyTripsLoading extends GetCompanyTripsState {}

final class GetCompanyTripSuccess extends GetCompanyTripsState {
  final List<TripModel> companyTrips;

  const GetCompanyTripSuccess({required this.companyTrips});
}

final class GetCompanyTripsEmpty extends GetCompanyTripsState {}

final class GetCompanyTripsFailure extends GetCompanyTripsState {
  final String errMessage;

  const GetCompanyTripsFailure({required this.errMessage});
}
