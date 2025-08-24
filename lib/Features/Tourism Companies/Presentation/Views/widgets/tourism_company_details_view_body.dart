import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_company_details_view_header.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view.dart';

class TourismCompanyDetailsViewBody extends StatelessWidget {
  const TourismCompanyDetailsViewBody({super.key, required this.company});

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        TourismCompanyDetailsViewHeader(company: company),
        SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
          child: CustomDescription(desc: company.description!),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 32)),

        PinnedHeaderSliver(
          child: TagsListView(
            data: ["الكل", "تراثي", "ديني", "ترفيهي", "طبيعي", "ثقافي"],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        SliverFillRemaining(child: TripsCardsListView(trips: [])),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
      ],
    );
  }
}
