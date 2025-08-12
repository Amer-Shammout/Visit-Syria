import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/utils/app_strings.dart';

Future<Either<Failure, T>> handleRequest<T>({
  required Future<Response> Function() requestFn,
  required T Function(dynamic data) parse,
}) async {
  try {
    final response = await requestFn();
    log("$response");
    return right(parse(response.data));
  } on DioException catch (e) {
    log("${e.message}");

    return left(ServerFailure.fromDioError(e));
  } catch (e) {
    return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
  }
}
