import 'package:dio/dio.dart';

class CreatePostModel {
  final String body;
  final MultipartFile? uploadPhoto;
  final List<String> tags;

  CreatePostModel({
    required this.body,
    required this.uploadPhoto,
    required this.tags,
  });
}
