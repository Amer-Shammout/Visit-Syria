import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_my_posts_cubit/get_my_posts_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Posts/my_posts_list_view_builder.dart';

class MyPostsViewBody extends StatefulWidget {
  const MyPostsViewBody({super.key});

  @override
  State<MyPostsViewBody> createState() => _MyPostsViewBodyState();
}

class _MyPostsViewBodyState extends State<MyPostsViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetMyPostsCubit>(context).fetchMyPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: TagsListView(
            data: ['الكل', "مقبول", "مرفوض", "انتظار"],
            onTagSelected: (value, index) {
              final cubit = BlocProvider.of<GetMyPostsCubit>(context);

              PostsFilter filter;
              switch (index) {
                case 0:
                  filter = PostsFilter.all;
                  break;
                case 1:
                  filter = PostsFilter.approved;
                  break;
                case 2:
                  filter = PostsFilter.rejected;
                  break;
                case 3:
                  filter = PostsFilter.pending;
                  break;
                default:
                  filter = PostsFilter.all;
              }

              cubit.filterMyPosts(filter); // هنا يتم استدعاء الفلترة
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        MyPostsListViewBuilder(),
      ],
    );
  }
}
