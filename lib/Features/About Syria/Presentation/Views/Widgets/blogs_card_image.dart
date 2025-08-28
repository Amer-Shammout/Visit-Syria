import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/manager/delete_save_cubit/delete_save_cubit.dart';
import 'package:visit_syria/Core/manager/set_save_cubit/set_save_cubit.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';

class BlogsCardImage extends StatelessWidget {
  const BlogsCardImage({
    super.key,
    required this.id,
    required this.articleModel,
  });
  final String id;
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox.expand(
            child: Image.asset(Assets.imagesDaraa, fit: BoxFit.cover),
          ),
        ),
        PositionedDirectional(
          start: 8,
          top: 8,
          child: BlocBuilder<DeleteSaveCubit, DeleteSaveState>(
            builder: (context, state) {
              return BlocBuilder<SetSaveCubit, SetSaveState>(
                builder: (context, state) {
                  return CustomBookmarkButton(
                    isActive: articleModel.isSaved ?? false,
                    id: id,
                    model: articleModel,
                    type: 'article',
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
