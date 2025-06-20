import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_card.dart';

class OffersGridView extends StatelessWidget {
  const OffersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.58,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => OffersCard(),
      itemCount: 20,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 16,right: 16,bottom: 32),
    );
  }
}
