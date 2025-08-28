import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/manager/delete_save_cubit/delete_save_cubit.dart';
import 'package:visit_syria/Core/manager/set_save_cubit/set_save_cubit.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class DetailsViewsHeader extends StatelessWidget {
  const DetailsViewsHeader({
    super.key,
    this.hasActionButton = true,
    required this.isSaved,
    required this.id,
    required this.type,
    this.model,
    this.action,
  });
  final bool hasActionButton;
  final bool isSaved;
  final String id;
  final String type;
  final dynamic model;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          inActiveIcon: Assets.iconsArrow,
          onTap: () {
            action != null ? action!() : null;
            GoRouter.of(context).pop();
          },
          isActive: false,
        ),
        hasActionButton
            ? BlocBuilder<DeleteSaveCubit, DeleteSaveState>(
              builder: (context, state) {
                return BlocBuilder<SetSaveCubit, SetSaveState>(
                  builder: (context, state) {
                    return CustomBookmarkButton(
                      isActive: getModel(),
                      id: id,
                      model: model,
                      type: type,
                    );
                  },
                );
              },
            )
            : SizedBox.shrink(),
      ],
    );
  }

  getModel() {
    if (model is PlaceModel ||
        model is TripModel ||
        model is CompanyModel ||
        model is EventModel ||
        model is ArticleModel ||
        model is PostModel) {
      return model.isSaved;
    }
  }
}
