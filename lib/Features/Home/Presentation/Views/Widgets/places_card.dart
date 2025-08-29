import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/manager/delete_save_cubit/delete_save_cubit.dart';
import 'package:visit_syria/Core/manager/set_save_cubit/set_save_cubit.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/custom_icon_button.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card_details.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/ribbon_label.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({super.key, this.place, this.action});

  final PlaceModel? place;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: AspectRatio(
        aspectRatio: 170 / 220,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomImage(height: 220, borderRadius: 24,image: place!.images![0],),
            PositionedDirectional(
              end: 12,
              top: 12,
              child: BlocBuilder<DeleteSaveCubit, DeleteSaveState>(
                builder: (context, state) {
                  return BlocBuilder<SetSaveCubit, SetSaveState>(
                    builder: (context, state) {
                      return CustomBookmarkButton(
                        action: action,
                        type: 'place',
                        model: place,
                        isActive: place?.isSaved,
                        id: place!.id!.toString(),
                      );
                    },
                  );
                },
              ),
            ),
            place?.rank != null
                ? PositionedDirectional(
                  top: 0,
                  start: 24,
                  child: RibbonLabel(text: "# ${place?.rank}"),
                )
                : SizedBox.shrink(),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: PlacesCardDetails(place: place),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBookmarkButton extends StatelessWidget {
  const CustomBookmarkButton({
    super.key,
    this.isSmall,
    required this.isActive,
    required this.id,
    required this.type,
    required this.model,
    this.action,
  });
  final bool? isSmall;
  final bool isActive;
  final String id;
  final String type;
  final dynamic model;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      inActiveIcon: Assets.iconsBookmarkStroke,
      onTap: () async {
        if (isActive) {
          await BlocProvider.of<DeleteSaveCubit>(
            context,
          ).deleteSave(id: id, type: type, model: model);
        } else {
          await BlocProvider.of<SetSaveCubit>(
            context,
          ).setSave(id: id, type: type, model: model);
        }
        action != null ? action!() : null;
      },
      isActive: isActive,
      activeIcon: Assets.iconsBookmarkFill,
      isSmall: isSmall ?? false,
    );
  }
}

class CustomSaveMultiBlocListener extends StatelessWidget {
  const CustomSaveMultiBlocListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SetSaveCubit, SetSaveState>(
          listener: (context, state) {
            if (state is SetSaveFailure) {
              showFailureSnackBar(state.errMessage, context);
            }
            if (state is SetSaveSuccess) {
              showSuccessSnackBar("تم حفظ العنصر بنجاح!", context);
            }
          },
        ),
        BlocListener<DeleteSaveCubit, DeleteSaveState>(
          listener: (context, state) {
            if (state is DeleteSaveFailure) {
              showFailureSnackBar(state.errMessage, context);
            }
            if (state is DeleteSaveSuccess) {
              showSuccessSnackBar("تم إلغاء حفظ العنصر بنجاح!", context);
            }
          },
        ),
      ],
      child: child,
    );
  }
}

class CustomSaveBlocBuilder extends StatelessWidget {
  const CustomSaveBlocBuilder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteSaveCubit, DeleteSaveState>(
      builder: (context, state) {
        return BlocBuilder<SetSaveCubit, SetSaveState>(
          builder: (context, state) {
            return child;
          },
        );
      },
    );
  }
}
