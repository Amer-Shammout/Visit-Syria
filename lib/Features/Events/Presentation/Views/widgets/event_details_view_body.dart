import 'package:flutter/material.dart';
import 'package:visit_syria/Core/data/Enums/enum.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_dialog.dart';
import 'package:visit_syria/Core/widgets/custom_description.dart';
import 'package:visit_syria/Core/widgets/custom_map.dart';
import 'package:visit_syria/Core/widgets/custom_sliver_app_bar.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/widgets/event_general_info.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/reservation_people_number.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/custom_floating_action_button.dart';

class EventDetailsViewBody extends StatelessWidget {
  const EventDetailsViewBody({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppBar(
                images: [
                  Assets.imagesTest,
                  Assets.imagesAzemPalace,
                  Assets.imagesIdlib,
                  Assets.imagesRasafe,
                ],
                title: event.name ?? "",
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
              SliverToBoxAdapter(child: EventGenerlInfo(event: event)),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomDescription(desc: event.description ?? ""),
              ),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(
                child: CustomMap(
                  latitude: double.parse(event.latitude!),
                  longitude: double.parse(event.longitude!),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 96)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: isFAB(event, context),
          ),
        ],
      ),
    );
  }
}

PriceStateEnum getEventPriceType(EventModel eventModel) {
  if (eventModel.priceType! == "free") {
    return PriceStateEnum.free;
  } else {
    return PriceStateEnum.common;
  }
}

Widget isFAB(EventModel event, BuildContext context) {
  if (event.eventType! == "unlimited" && event.priceType! == "free") {
    return SizedBox.shrink();
  } else {
    return CustomFloatingActionButton(
      type: getEventPriceType(event),
      price:
          getEventPriceType(event) == PriceStateEnum.free
              ? "مجاناً"
              : event.price!,
      onPressed: () {
        ReservationModel reservationModel = ReservationModel();
        reservationModel.eventModel = event;
        showDialog(
          context: context,
          builder: (context) {
            return CustomDialog(
              title: "أدخل عدد التذاكر",
              icon: Assets.iconsUser,
              child: ReservationPeopleNumber(
                maxCounter:
                    event.eventType! == "limited"
                        ? event.remainingTickets
                        : null,
                reservationModel: reservationModel,
              ),
            );
          },
        );
      },
    );
  }
}
