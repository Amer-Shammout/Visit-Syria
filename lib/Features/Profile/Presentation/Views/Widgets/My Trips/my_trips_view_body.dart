import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_my_booking_cubit/get_my_booking_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Trips/my_trips_view_builder.dart';

class MyTripsViewBody extends StatefulWidget {
  const MyTripsViewBody({super.key});

  @override
  State<MyTripsViewBody> createState() => _MyTripsViewBodyState();
}

class _MyTripsViewBodyState extends State<MyTripsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetMyBookingCubit>(context).getMyBooking('trip', 'الكل');
  }

  List<String> categories = [
    "الكل",
    "لم تبدأ بعد",
    "جارية الآن",
    "منتهية",
    "غير مكتملة",
  ];
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: TagsListView(
            onTagSelected: (value, index) async {
              selectedCategoryIndex = index;
              await BlocProvider.of<GetMyBookingCubit>(
                context,
              ).getMyBooking('trip', categories[selectedCategoryIndex]);
            },
            data: categories,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        SliverFillRemaining(
          child: MyTripsViewBuilder(
            category: categories[selectedCategoryIndex],
          ),
        ),
      ],
    );
  }
}
