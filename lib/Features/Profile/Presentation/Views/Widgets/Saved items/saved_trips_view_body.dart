import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view.dart';

class SavedTripsViewBody extends StatelessWidget {
  const SavedTripsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [TripsCardsListView()],
    );
  }
}
