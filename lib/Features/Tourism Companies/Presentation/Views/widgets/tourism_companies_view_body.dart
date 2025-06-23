import 'package:flutter/widgets.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_companies_cards_grid_view.dart';

class TourismCompaniesViewBody extends StatelessWidget {
  const TourismCompaniesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      clipBehavior: Clip.none,
      slivers: [TourismCompaniesCardsGridView()],
    );
  }
}
