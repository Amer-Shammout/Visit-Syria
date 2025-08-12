import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/widgets/mini_trip_card.dart';

class AllMiniTripCardsViewBody extends StatelessWidget {
  const AllMiniTripCardsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.64,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder:
          (context, index) => GestureDetector(
            onTap:
                () =>
                    GoRouter.of(context).pushNamed(AppRouter.kTripDetailsName),
            child: MiniTripCard(),
          ),
      itemCount: 20,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
    );
  }
}
