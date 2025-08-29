import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_with_tab_bar.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/home_cubit/home_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_my_booking_cubit/get_my_booking_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Events%20&%20My%20Flights/my_events_list_view_builder.dart.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Events%20&%20My%20Flights/my_flights_list_view_builder.dart';

class MyReservationView extends StatefulWidget {
  const MyReservationView({super.key});

  @override
  State<MyReservationView> createState() => _MyReservationViewState();
}

class _MyReservationViewState extends State<MyReservationView> {
  final List<String> eventsCategories = [
    'الكل',
    'لم تبدأ بعد',
    'جارية الآن',
    'منتهية',
    'غير مكتملة',
  ];
  final List<String> flightCategories = ['الكل', 'غير مكتملة'];
  int eventIndex = 0, flightIndex = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetMyBookingCubit>(context).getMyBooking('event', 'الكل');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: CustomAppBarWithTabBar(
          onTap: (index) {
            index == 0
                ? BlocProvider.of<GetMyBookingCubit>(
                  context,
                ).getMyBooking('event', 'الكل')
                : BlocProvider.of<GetMyBookingCubit>(
                  context,
                ).getMyBooking('flight', 'الكل');
          },
          tab1: 'الأحداث',
          tab2: 'تذاكر الطيران',
          title: 'حجوزاتي',
          onPressed: () {
            BlocProvider.of<HomeCubit>(context).fetchHomeData();
            GoRouter.of(context).pop();
          },
        ),
        body: TabBarView(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
                PinnedHeaderSliver(
                  child: TagsListView(
                    data: eventsCategories,
                    onTagSelected: (value, index) {
                      eventIndex = index;
                      setState(() {});
                      BlocProvider.of<GetMyBookingCubit>(
                        context,
                      ).getMyBooking('event', eventsCategories[index]);
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
                SliverFillRemaining(
                  child: MyEventsListViewBuilder(
                    category: eventsCategories[eventIndex],
                  ),
                ),
              ],
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s20)),
                PinnedHeaderSliver(
                  child: TagsListView(
                    data: flightCategories,
                    onTagSelected: (value, index) {
                      flightIndex = index;
                      setState(() {});
                      BlocProvider.of<GetMyBookingCubit>(
                        context,
                      ).getMyBooking('flight', flightCategories[index]);
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
                SliverFillRemaining(
                  child: MyFlightsListViewBuilder(
                    category: flightCategories[flightIndex],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
