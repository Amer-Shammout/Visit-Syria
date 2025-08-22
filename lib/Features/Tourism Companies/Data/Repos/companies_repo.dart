import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';

abstract class CompaniesRepo{
  Future<Either<Failure,List<CompanyModel>>>getAllCompanies();
}