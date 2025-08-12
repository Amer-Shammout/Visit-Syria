import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar.dart';
import 'package:visit_syria/Core/widgets/custom_drawer.dart';
import 'package:visit_syria/Core/widgets/custom_nav_bar.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/about_syria_view_body.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/community_view_body.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/home_view_body_builder.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/cities_view_body.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/trips_view_body.dart';

class AppRootView extends StatefulWidget {
  const AppRootView({super.key});

  @override
  State<AppRootView> createState() => _AppRootViewState();
}

class _AppRootViewState extends State<AppRootView> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeViewBodyBuilder(),
    CitiesViewBody(),
    TripsViewBody(),
    CommunityViewBody(),
    AboutSyriaViewBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
