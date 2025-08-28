import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:visit_syria/Core/data/Enums/enum.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_expanstion_tile.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_info_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/Reservation%20Info%20Form/custom_expansion_tile_form.dart';

class ReservationExpansionTile extends StatefulWidget {
  const ReservationExpansionTile({
    super.key,
    required this.reservationModel,
    required this.index,
    this.initiallyExpanded,
    this.onExpansionChanged,

    this.deletedItem,
    required this.formKey,
    required this.isAutoValidate,
    required this.errorStroke,
  });
  final ReservationInfoModel? deletedItem;
  final ReservationModel? reservationModel;
  final int index;
  final bool? initiallyExpanded;
  final void Function(bool)? onExpansionChanged;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode isAutoValidate;
  final bool errorStroke;

  @override
  State<ReservationExpansionTile> createState() =>
      _ReservationExpansionTileState();
}

class _ReservationExpansionTileState extends State<ReservationExpansionTile>
    with AutomaticKeepAliveClientMixin {
  String getTitle() {
    String title = "";
    if (widget.reservationModel!.info![widget.index].firstName != null &&
        widget.reservationModel!.info![widget.index].lastName != null) {
      title =
          "${widget.reservationModel!.info![widget.index].firstName} ${widget.reservationModel!.info![widget.index].lastName}";
    } else {
      title = "الشخص ${widget.index + 1}";
    }
    if (widget.reservationModel!.flightModel != null) {
      if (widget.reservationModel!.ageState![widget.index] ==
          AgeStateEnum.adult) {
        title = "$title (بالغ)";
      }
      if (widget.reservationModel!.ageState![widget.index] ==
          AgeStateEnum.child) {
        title = "$title (طفل)";
      }
      if (widget.reservationModel!.ageState![widget.index] ==
          AgeStateEnum.infant) {
        title = "$title (رضيع)";
      }
    }
    if (widget.reservationModel!.flightModel == null && widget.index == 0) {
      title = "$title (بالغ)";
    }
    return title;
  }

  @override
  void initState() {
    super.initState();
    widget.reservationModel!.ageState = [];
    if (widget.reservationModel!.passengers != null) {
      for (var i = 0; i < widget.reservationModel!.passengers!.adults; i++) {
        widget.reservationModel!.ageState!.add(AgeStateEnum.adult);
      }
      for (var i = 0; i < widget.reservationModel!.passengers!.children; i++) {
        widget.reservationModel!.ageState!.add(AgeStateEnum.child);
      }
      for (var i = 0; i < widget.reservationModel!.passengers!.infants; i++) {
        widget.reservationModel!.ageState!.add(AgeStateEnum.infant);
      }
    }
  }

  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    log("index: ${widget.index}");
    return CustomExpansionTile(
      borderSide: widget.errorStroke ? AppColors.red : null,
      initiallyExpanded: widget.initiallyExpanded,
      onExpansionChanged: (isExpanded) {
        expanded = isExpanded;
        setState(() {});
      },
      backGroundColor: AppColors.whiteColor,
      maintainState: true,
      title: getTitle(),
      titleTextStyle:
          widget.reservationModel!.info![widget.index].firstName != null &&
                  widget.reservationModel!.info![widget.index].lastName != null
              ? AppStyles.fontsBold18(
                context,
              ).copyWith(color: AppColors.titleTextColor)
              : AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.bodyTextColor),
      icon: Assets.iconsUser,
      children: [
        Offstage(
          offstage: !expanded,
          child: CustomExpansionTileForm(
            isAutoValidate: widget.isAutoValidate,
            formKey: widget.formKey,
            reservationModel: widget.reservationModel!,
            index: widget.index,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
