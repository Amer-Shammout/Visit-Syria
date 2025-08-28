import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/manager/delete_save_cubit/delete_save_cubit.dart';
import 'package:visit_syria/Core/manager/set_save_cubit/set_save_cubit.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_all_approved_posts_by_tag_cubit/get_all_approved_posts_by_tag_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_my_posts_cubit/get_my_posts_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_action_button.dart';

class PostActionButtons extends StatelessWidget {
  const PostActionButtons({
    super.key,
    required this.postModel,
    this.isMyPost = false,
  });

  final PostModel postModel;
  final bool isMyPost;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PostActionButton(
            inActiveIcon: Assets.iconsHeartInActive,
            text: "${postModel.likesCount}",
            activeIcon: Assets.iconsHeartActive,
            isSelected: postModel.isLiked!,
            onTap: () async {
              !isMyPost
                  ? BlocProvider.of<GetAllApprovedPostsByTagCubit>(
                    context,
                  ).toggleLikeForPost(postModel.id.toString())
                  : {
                    postModel.status != "Approved"
                        ? showFailureSnackBar(
                          "لم يتم قبول المنشور بعد!",
                          context,
                        )
                        : {
                          await BlocProvider.of<GetMyPostsCubit>(
                            context,
                          ).toggleLikeForPost(postModel.id.toString()),
                          BlocProvider.of<GetAllApprovedPostsByTagCubit>(
                            context,
                          ).fetchPosts("الكل"),
                        },
                  };
            },
          ),
        ),
        SizedBox(width: AppSpacing.s8),
        Expanded(
          child: PostActionButton(
            inActiveIcon: Assets.iconsComment,
            text: "${postModel.commentsCount}",
            onTap:
                () =>
                    postModel.status == "Approved"
                        ? GoRouter.of(context).pushNamed(
                          AppRouter.kAllCommentsName,
                          extra: postModel.comments,
                          pathParameters: {
                            'postID': postModel.id.toString(),
                            "isMyPost": isMyPost.toString(),
                          },
                        )
                        : null,
          ),
        ),
        SizedBox(width: AppSpacing.s8),
        Expanded(
          child: BlocBuilder<DeleteSaveCubit, DeleteSaveState>(
            builder: (context, state) {
              return BlocBuilder<SetSaveCubit, SetSaveState>(
                builder: (context, state) {
                  return PostActionButton(
                    onTap: () {
                      if (postModel.status == "Approved") {
                        if (postModel.isSaved!) {
                          BlocProvider.of<DeleteSaveCubit>(context).deleteSave(
                            id: postModel.id.toString(),
                            type: 'post',
                            model: postModel,
                          );
                        } else {
                          BlocProvider.of<SetSaveCubit>(context).setSave(
                            id: postModel.id.toString(),
                            type: 'post',
                            model: postModel,
                          );
                        }
                        isMyPost
                            ? BlocProvider.of<GetAllApprovedPostsByTagCubit>(
                              context,
                            ).fetchPosts("الكل")
                            : null;
                      } else {
                        showFailureSnackBar(
                          "لم يتم قبول المنشور بعد!",
                          context,
                        );
                      }
                    },
                    inActiveIcon: Assets.iconsBookmarkStroke,
                    text: "حفظ",
                    activeIcon: Assets.iconsBookmarkFill,
                    isSelected: postModel.isSaved!,
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
