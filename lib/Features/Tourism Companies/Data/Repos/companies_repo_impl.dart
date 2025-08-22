import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Repos/companies_repo.dart';

class CompaniesRepoImpl extends CompaniesRepo {
  @override
  Future<Either<Failure, List<CompanyModel>>> getAllCompanies() {
    return handleRequest(
      requestFn:
          () => getIt.get<DioClient>().get(
            kGetAllCompaniesURL,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<CompanyModel> companies = [];
        for (var company in data['companies']) {
          companies.add(CompanyModel.fromJson(company));
        }
        return companies;
      },
    );
  }
}
