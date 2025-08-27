import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/trips_categories_list.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/company_trips_list_view_builder.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_company_details_view_header.dart';
import 'package:visit_syria/Features/Trips/Presentation/manager/get_company_trips_cubit/get_company_trips_cubit.dart';

class TourismCompanyDetailsViewBody extends StatefulWidget {
  const TourismCompanyDetailsViewBody({super.key, required this.company});

  final CompanyModel company;

  @override
  State<TourismCompanyDetailsViewBody> createState() =>
      _TourismCompanyDetailsViewBodyState();
}

class _TourismCompanyDetailsViewBodyState
    extends State<TourismCompanyDetailsViewBody> {
  int selectedCategoryIndex = 0;

  @override
  void initState() async {
    super.initState();
    await BlocProvider.of<GetCompanyTripsCubit>(
      context,
    ).getCompanyTrips(widget.company.id!, kTripsCategories[0]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        TourismCompanyDetailsViewHeader(company: widget.company),
        SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
          child: CustomDescription(desc: widget.company.description!),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 32)),

        PinnedHeaderSliver(
          child: TagsListView(
            data: kTripsCategories,
            onTagSelected: (value, index) async {
              selectedCategoryIndex = index;
              await BlocProvider.of<GetCompanyTripsCubit>(
                context,
              ).getCompanyTrips(
                widget.company.id!,
                kTripsCategories[selectedCategoryIndex],
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),

        SliverFillRemaining(
          child: CompanyTripsListViewBuilder(
            category: kTripsCategories[selectedCategoryIndex],
            companyModel: widget.company,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
      ],
    );
  }
}
