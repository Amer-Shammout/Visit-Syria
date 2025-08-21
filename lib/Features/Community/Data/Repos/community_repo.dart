import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Community/Data/Models/create_post_model.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';

abstract class CommunityRepo {
  Future<Either<Failure, List<PostModel>>> getAllApprovedPostsByTag(String tag);
  Future<Either<Failure, List<PostModel>>> getMyPosts();
  Future<Either<Failure, dynamic>> createPost(CreatePostModel model);
  Future<Either<Failure, dynamic>> toggleLike(String id);
  Future<Either<Failure, dynamic>> setComment(String comment, String id);
}
