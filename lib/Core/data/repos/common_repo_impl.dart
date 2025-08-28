import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/data/models/comment_model/comment_model.dart';
import 'package:visit_syria/Core/data/repos/common_repo.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';

class CommonRepoImpl extends CommonRepo {
  @override
  Future<Either<Failure, List<CommentModel>>> getFeedback({
    required String id,
    required String type,
  }) {
    final url = "$kGetFeedbackUrl$id?type=$type&rating=all";
    return handleRequest(
      requestFn: () => getIt.get<DioClient>().get(url),
      parse: (data) {
        final List<CommentModel> comments = [];
        for (var comment in data['comments']) {
          comments.add(CommentModel.fromJson(comment));
        }
        return comments;
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> deleteSave({
    required String id,
    required String type,
  }) {
    return handleDelete(
      requestFn:
          () => getIt.get<DioClient>().delete(
            "$kSaveUrl$id?type=$type",
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
    );
  }

  @override
  Future<Either<Failure, dynamic>> setSave({
    required String id,
    required String type,
  }) {
    return handleRequest<dynamic>(
      requestFn:
          () => getIt.get<DioClient>().post(
            "$kSaveUrl$id?type=$type",
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) => data,
    );
  }
}
