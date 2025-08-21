import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/avatar_and_name_and_history.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/expandable_text.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_action_buttons.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_image.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blogs_tags_wrap.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_state_tag.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.hasImage,
    required this.postModel,
    required this.displayStatus,
    this.isMyPost = false,
  });

  final bool hasImage;
  final PostModel postModel;
  final bool displayStatus;
  final bool isMyPost;

  @override
  Widget build(BuildContext context) {
    return CustomCardBackground(
      padding: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hasImage ? PostImage() : SizedBox.shrink(),
          hasImage ? SizedBox(height: AppSpacing.s16) : SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvatarandNameandHistory(
                date: postModel.createdAt!,
                name: postModel.user!.name!,
              ),
              displayStatus
                  ? PostStateTag(state: postModel.status!)
                  : SizedBox.shrink(),
            ],
          ),
          SizedBox(height: AppSpacing.s16),
          ExpandableText(postModel.description!),
          SizedBox(height: AppSpacing.s12),
          PostandBlogsTagsWrap(tags: postModel.tags!),
          SizedBox(height: AppSpacing.s16),
          PostActionButtons(postModel: postModel, isMyPost: isMyPost),
        ],
      ),
    );
  }
}
