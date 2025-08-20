import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/comment.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/user.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_all_approved_posts_by_tag_cubit/get_all_approved_posts_by_tag_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_my_posts_cubit/get_my_posts_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/set_comment_cubit/set_comment_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/comment_bottom_sheet.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/comments_list_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';

class AllCommentsView extends StatefulWidget {
  const AllCommentsView({
    super.key,
    required this.comments,
    this.postId,
    required this.isMyPost,
  });

  final List<Comment> comments;
  final String? postId;
  final String? isMyPost;

  @override
  State<AllCommentsView> createState() => _AllCommentsViewState();
}

class _AllCommentsViewState extends State<AllCommentsView> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "كل التعليقات"),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CommentsListView(
            hasRate: false,
            shrinkWrap: false,
            postComments: widget.comments,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      bottomSheet: CommentBottomSheet(
        textEditingController: textEditingController,
        onFieldSubmitted: (comment) async {
          setState(() {
            textEditingController.text = '';
          });

          await BlocProvider.of<SetCommentCubit>(
            context,
          ).setComment(comment, widget.postId!);
          if (BlocProvider.of<SetCommentCubit>(context).state
              is SetCommentSuccess) {
            setState(() {
              widget.comments.add(
                Comment(
                  comment: comment,
                  createdAt: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                  user: User(
                    name: GetProfileCubit.userModel?.me?.profile?.firstName,
                    profilePhoto: GetProfileCubit.userModel?.me?.profile?.photo,
                  ),
                ),
              );
              if (parseBool(widget.isMyPost!)) {
                BlocProvider.of<GetAllApprovedPostsByTagCubit>(
                  context,
                ).fetchPosts("الكل");
                BlocProvider.of<GetMyPostsCubit>(context).fetchMyPosts();
              } else {
                BlocProvider.of<GetAllApprovedPostsByTagCubit>(
                  context,
                ).fetchPosts("الكل");
              }
            });
          }
          if (BlocProvider.of<SetCommentCubit>(context).state
              is SetCommentFailure) {
            showFailureSnackBar("حدث خطأ ما يرجى إعادة المحاولة!", context);
          }
        },
      ),
    );
  }

  bool parseBool(String str) {
    return str.toLowerCase() == 'true';
  }
}
