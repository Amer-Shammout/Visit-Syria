part of 'get_all_companies_cubit.dart';

sealed class GetAllCompaniesState extends Equatable {
  const GetAllCompaniesState();

  @override
  List<Object> get props => [];
}

final class GetAllCompaniesInitial extends GetAllCompaniesState {}

final class GetAllCompaniesLoading extends GetAllCompaniesState {}

final class GetAllCompaniesFailure extends GetAllCompaniesState {
  final String errMessage;

  const GetAllCompaniesFailure({required this.errMessage});
}

final class GetAllCompaniesSuccess extends GetAllCompaniesState {
  final List<CompanyModel> companies;

  const GetAllCompaniesSuccess({required this.companies});
}
