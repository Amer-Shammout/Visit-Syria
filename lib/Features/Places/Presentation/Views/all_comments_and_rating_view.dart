import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/all_comments_and_rating_view_body.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/rating_form.dart';

class AllCommentsAndRatingView extends StatelessWidget {
  const AllCommentsAndRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "التقييمات و التعليقات"),
      body: AllCommentsAndRatingViewBody(),
      bottomSheet: Wrap(children: [RatingForm(padding: 0)]),
    );
  }
}