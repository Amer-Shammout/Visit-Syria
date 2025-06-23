import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_company_card.dart';

class TourismCompaniesCardsGridView extends StatelessWidget {
  const TourismCompaniesCardsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 32, top: 8),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.755,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder:
            (context, index) => GestureDetector(
              onTap:
                  () => GoRouter.of(
                    context,
                  ).pushNamed(AppRouter.kTourismCompanyDetailsName),
              child: TourismCompanyCard(),
            ),
        itemCount: 16,
      ),
    );
  }
}
