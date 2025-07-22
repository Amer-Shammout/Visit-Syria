import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/hotels_and_resturants_grid_view.dart';

class SavedResturantsViewBody extends StatelessWidget {
  const SavedResturantsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [HotelsAndResturantGridView()],
    );
  }
}
