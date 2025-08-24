import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Repos/companies_repo.dart';

part 'get_all_companies_state.dart';

class GetAllCompaniesCubit extends Cubit<GetAllCompaniesState> {
  GetAllCompaniesCubit(this._companiesRepo) : super(GetAllCompaniesInitial());
  final CompaniesRepo _companiesRepo;

  Future<void> getAllCompanies() async {
    emit(GetAllCompaniesLoading());
    final result = await _companiesRepo.getAllCompanies();
    result.fold(
      (failure) => emit(GetAllCompaniesFailure(errMessage: failure.errMessage)),
      (companies) => emit(GetAllCompaniesSuccess(companies: companies)),
    );
  }
}
