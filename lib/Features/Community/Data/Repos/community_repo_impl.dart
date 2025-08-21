import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Community/Data/Models/create_post_model.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';
import 'package:visit_syria/Features/Community/Data/Repos/community_repo.dart';

class CommunityRepoImpl extends CommunityRepo {
  @override
  Future<Either<Failure, List<PostModel>>> getAllApprovedPostsByTag(
    String tag,
  ) async {
    final encodedTag = Uri.encodeComponent(tag);
    final url = "$kGetAllApprovedPostsByTagUrl?tagName=$encodedTag";

    return await handleRequest<List<PostModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<PostModel> posts = [];
        for (var item in data['data']) {
          posts.add(PostModel.fromJson(item));
        }
        return posts;
      },
    );
  }

  @override
  Future<Either<Failure, List<PostModel>>> getMyPosts() async {
    const url = kGetMyPostsUrl;

    return await handleRequest<List<PostModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<PostModel> posts = [];
        for (var item in data['data']) {
          posts.add(PostModel.fromJson(item));
        }
        return posts;
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> createPost(CreatePostModel model) async {
    final formData = FormData();

    formData.fields.add(MapEntry("description", model.body));

    for (var i = 0; i < model.tags.length; i++) {
      formData.fields.add(MapEntry("tags[$i]", model.tags[i]));
    }

    if (model.uploadPhoto != null) {
      formData.files.add(MapEntry("image", model.uploadPhoto!));
    }

    return await handleRequest<dynamic>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kCreatePostUrl,
            data: formData,
            options: Options(
              headers: {
                "Authorization": "Bearer ${Prefs.getString(kToken)}",
                "Content-Type": "multipart/form-data",
              },
            ),
          ),
      parse: (data) => data,
    );
  }

  @override
  Future<Either<Failure, dynamic>> toggleLike(String id) async {
    return await handleRequest<dynamic>(
      requestFn:
          () => getIt.get<DioClient>().post(
            "$kToggleLikeUrl$id$kToggleLikeUrl2",
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) => data,
    );
  }

  @override
  Future<Either<Failure, dynamic>> setComment(String comment, String id) async {
    return await handleRequest<dynamic>(
      requestFn:
          () => getIt.get<DioClient>().post(
            "$kSetCommentUrl$id?type=post",
            data: {"body": comment},
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) => data,
    );
  }
}
