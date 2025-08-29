import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/manager/delete_save_cubit/delete_save_cubit.dart';
import 'package:visit_syria/Core/manager/set_save_cubit/set_save_cubit.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/offers_tag.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class TripsCardImage extends StatelessWidget {
  const TripsCardImage({
    super.key,
    required this.imageHeight,
    required this.positionedVal,
    required this.discount,
    required this.title,
    required this.isSaved,
    required this.id,
    required this.model,
    required this.action,
  });

  final double imageHeight;
  final double positionedVal;
  final String discount;
  final String? title;
  final bool isSaved;
  final String id;
  final TripModel model;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage(height: imageHeight, borderRadius: 20),
        Positioned(
          left: positionedVal,
          right: positionedVal,
          top: positionedVal,
          bottom: positionedVal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  double.parse(discount) != 0
                      ? OffersTag(
                        discount: double.parse(discount).round().toString(),
                      )
                      : SizedBox(),
                  BlocBuilder<DeleteSaveCubit, DeleteSaveState>(
                    builder: (context, state) {
                      return BlocBuilder<SetSaveCubit, SetSaveState>(
                        builder: (context, state) {
                          return CustomBookmarkButton(
                            isActive: model.isSaved ?? false,
                            id: id.toString(),
                            model: model,
                            type: 'trip',
                            action: action,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Text(
                title ?? ' رحلة إلى سواحل سوريا',
                style: AppStyles.fontsBold16(
                  context,
                ).copyWith(color: AppColors.whiteColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
