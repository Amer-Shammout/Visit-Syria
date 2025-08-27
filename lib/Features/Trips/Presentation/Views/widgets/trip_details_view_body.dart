import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/data/Enums/enum.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_dialog.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_and_blogs_tags_wrap.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_floating_action_button.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_improvements.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_map_with_path.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_similar_trips_builder.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_time_line.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/reservation_people_number.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_general_info.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_card_header.dart';
import 'package:visit_syria/Features/Trips/Presentation/manager/get_similar_trips_cubit/get_similar_trips_cubit.dart';

class TripDetailsViewBody extends StatefulWidget {
  const TripDetailsViewBody({super.key, required this.tripModel});
  final TripModel tripModel;

  @override
  State<TripDetailsViewBody> createState() => _TripDetailsViewBodyState();
}

class _TripDetailsViewBodyState extends State<TripDetailsViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetSimilarTripsCubit>(
      context,
    ).getSimilarTrips(widget.tripModel.id!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppBar(
                model: widget.tripModel,
                type: 'trip',
                id: widget.tripModel.id.toString(),
                isSaved: widget.tripModel.isSaved!,
                images: [
                  Assets.imagesTest,
                  Assets.imagesAzemPalace,
                  Assets.imagesIdlib,
                  Assets.imagesRasafe,
                ],
                title:
                    widget.tripModel.name ?? " رحلة في سوريا اوعى تجي او ترجع",
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TripsCardGeneralInfo.tripGeneralInfo(
                    tripModel: widget.tripModel,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTourismCompanyRow(
                    company: widget.tripModel.company,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PostandBlogsTagsWrap(
                    tags: widget.tripModel.tags ?? ["ششش", "ععع", "ضضض"],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomDescription(
                  desc:
                      widget.tripModel.description ??
                      "انضم إلينا في رحلة لا تُنسى إلى السواحل السورية، حيث تمتد الرمال الذهبية على طول البحر، وتحتضن المدن الساحلية كـ اللاذقية وطرطوس عبق التاريخ وروعة الطبيعة.",
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              if (widget.tripModel.improvements != null) ...[
                SliverToBoxAdapter(
                  child: CustomImprovements(
                    improvements: widget.tripModel.improvements!,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              ],

              if (widget.tripModel.tripPath != null) ...[
                SliverToBoxAdapter(
                  child: CustomMapWithPath(
                    tripPath: widget.tripModel.tripPath!,
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              ],

              SliverToBoxAdapter(
                child: CustomTimeLine(timelines: widget.tripModel.timelines),
              ),
              SliverToBoxAdapter(child: CustomSimilarTripsBuilder()),
              SliverToBoxAdapter(child: SizedBox(height: 96)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomFloatingActionButton(
              type:
                  isOffer(widget.tripModel)
                      ? PriceStateEnum.offer
                      : PriceStateEnum.common,
              price:
                  isOffer(widget.tripModel)
                      ? widget.tripModel.newPrice!
                      : widget.tripModel.price!,
              onPressed: () {
                ReservationModel reservationModel = ReservationModel();
                reservationModel.tripModel = widget.tripModel;
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog(
                      title: "أدخل عدد التذاكر",
                      icon: Assets.iconsUser,
                      child: ReservationPeopleNumber(
                        reservationModel: reservationModel,
                        maxCounter: widget.tripModel.remainingTickets!,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

bool isOffer(TripModel trip) {
  if (double.parse(trip.discount!) == 0) {
    return false;
  } else {
    return true;
  }
}
