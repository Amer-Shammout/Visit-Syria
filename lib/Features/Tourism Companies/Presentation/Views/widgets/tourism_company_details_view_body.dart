import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_company_details_view_header.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view.dart';

class TourismCompanyDetailsViewBody extends StatelessWidget {
  const TourismCompanyDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        TourismCompanyDetailsViewHeader(),
        SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
          child: CustomDescription(
            desc:
                'شركة "Take Off" هي شركة رائدة في تنظيم الرحلات السياحية المميزة حول العالم. تأسست الشركة بهدف تقديم تجارب سفر فريدة تجمع بين الرفاهية، المغامرة، والثقافة. تتميز "عالم الرحلات السياحية" بفريق محترف من الخبراء الذين يخططون رحلات مخصصة تناسب جميع أنواع المسافرين، سواء كانوا يبحثون عن استكشاف مدن تاريخية، رحلات طبيعية خلابة، أو عطلات استجمامية على الشواطئ البكر.',
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 32)),

        PinnedHeaderSliver(
          child: TagsListView(
            data: ["الكل", "تراثي", "ديني", "ترفيهي", "طبيعي", "ثقافي"],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        TripsCardsListView(trips: []),
      ],
    );
  }
}
