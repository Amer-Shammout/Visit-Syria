import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_with_tab_bar.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/hotels_and_resturants_grid_view.dart';

class HotelsAndResturantsView extends StatelessWidget {
  const HotelsAndResturantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: CustomAppBarWithTabBar(),
        body: TabBarView(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [HotelsAndResturantGridView()],
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [HotelsAndResturantGridView()],
            ),
          ],
        ),
      ),
    );
  }
}
