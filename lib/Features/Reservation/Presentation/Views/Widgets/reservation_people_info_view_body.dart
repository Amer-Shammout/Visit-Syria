import 'dart:developer';

import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/confirm_delete_dialog.dart';
import 'package:visit_syria/Core/widgets/custom_general_floating_button.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_info_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/reservation_expansion_tile.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/shaking_icon.dart';

class ReservationPeopleInfoViewBody extends StatefulWidget {
  const ReservationPeopleInfoViewBody({
    super.key,
    required this.reservationModel,
  });
  final ReservationModel reservationModel;

  @override
  State<ReservationPeopleInfoViewBody> createState() =>
      _ReservationPeopleInfoViewBodyState();
}

class _ReservationPeopleInfoViewBodyState
    extends State<ReservationPeopleInfoViewBody> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<GlobalKey<FormState>> formKeys = [];
  List<AutovalidateMode> isAutoValidate = [];
  List<bool> strokeError = [];
  @override
  void initState() {
    super.initState();

    _setFirstPersonInfo();
    widget.reservationModel.hasError = [];
  }

  void _setFirstPersonInfo() {
    final profile = GetProfileCubit.userModel?.me?.profile;
    final user = GetProfileCubit.userModel?.me?.user;

    final info = widget.reservationModel.info![0];

    info.firstName = profile?.firstName ?? info.firstName;
    info.lastName = profile?.lastName ?? info.lastName;
    info.email = user?.email ?? info.email;
    info.nationality = profile?.country ?? info.nationality;
    info.birthDate = profile?.dateOfBirth ?? info.birthDate;
    info.gender = profile?.gender ?? info.gender;
    info.phone = profile?.phone?.toString() ?? info.phone;
    info.countryCode = profile?.countryCode?.toString() ?? info.countryCode;
    log("${info.countryCode}");
    info.isoCode =
        info.countryCode != null
            ? CountryPickerUtils.getCountryByPhoneCode(
              info.countryCode!.substring(1),
            ).isoCode
            : null;
  }

  void _removeItem(int index) {
    final removedItem = widget.reservationModel.info![index];
    widget.reservationModel.info!.removeAt(index);
    List<ReservationInfoModel> tempInfo = [];
    for (var i = 0; i <= index - 1; i++) {
      tempInfo.add(ReservationInfoModel());
    }
    tempInfo.add(removedItem);
    final ReservationModel temp = ReservationModel(info: tempInfo);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: ReservationExpansionTile(
            initiallyExpanded: false,
            isAutoValidate: isAutoValidate[index],
            errorStroke: strokeError[index],
            formKey: formKeys[index],
            reservationModel: temp,
            index: index,

            onExpansionChanged: (_) {},
          ),
        ),
      ),

      duration: const Duration(milliseconds: 400),
    );

    widget.reservationModel.difference =
        widget.reservationModel.difference! - 1;
    widget.reservationModel.tickets = widget.reservationModel.tickets! - 1;
    widget.reservationModel.difference! == 0
        ? widget.reservationModel.deletePeople = false
        : widget.reservationModel.deletePeople = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.reservationModel.info!.length; i++) {
      log("${widget.reservationModel.info![i]}");
    }
    return Stack(
      children: [
        AnimatedList.separated(
          key: _listKey,
          padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 120),
          initialItemCount: widget.reservationModel.info!.length,
          itemBuilder: (context, index, animation) {
            if (formKeys.length <= index) {
              formKeys.add(GlobalKey<FormState>());
            }
            if (isAutoValidate.length <= index) {
              isAutoValidate.add(AutovalidateMode.disabled);
            }
            if (widget.reservationModel.hasError!.length <= index) {
              widget.reservationModel.hasError!.add(false);
            }
            if (strokeError.length <= index) {
              strokeError.add(false);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [Shadows.shadow],
                    ),
                    child: SizeTransition(
                      sizeFactor: animation,
                      child: ReservationExpansionTile(
                        errorStroke: strokeError[index],
                        formKey: formKeys[index],
                        isAutoValidate: isAutoValidate[index],
                        initiallyExpanded: false,
                        index: index,
                        reservationModel: widget.reservationModel,
                      ),
                    ),
                  ),
                ),
                (widget.reservationModel.deletePeople != null &&
                        widget.reservationModel.deletePeople! == true)
                    ? SizedBox(width: 4)
                    : SizedBox.shrink(),
                (widget.reservationModel.deletePeople != null &&
                        index != 0 &&
                        widget.reservationModel.deletePeople! == true)
                    ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconButton(
                        onPressed:
                            () => showDialog(
                              context: context,
                              builder: (context) {
                                return CustomConfirmDialog(
                                  onPressed: () {
                                    GoRouter.of(context).pop();
                                    _removeItem(index);
                                    formKeys.removeAt(index);
                                    isAutoValidate.removeAt(index);
                                    widget.reservationModel.hasError!.removeAt(
                                      index,
                                    );
                                  },
                                  text: 'هل أنت متأكد من عملية الحذف؟',
                                  confirmTitle: 'حذف',
                                  confirmColor: AppColors.red,
                                );
                              },
                            ),
                        icon: ShakingIcon(
                          child: SvgPicture.asset(
                            Assets.iconsTrash,
                            width: 24,
                            height: 24,
                            colorFilter: const ColorFilter.mode(
                              AppColors.red,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
              ],
            );
          },
          separatorBuilder: (
            BuildContext context,
            int index,
            Animation<double> animation,
          ) {
            return SizedBox(height: AppSpacing.s16);
          },
          removedSeparatorBuilder: (
            BuildContext context,
            int index,
            Animation<double> animation,
          ) {
            return SizeTransition(
              sizeFactor: animation,
              child: SizedBox(height: AppSpacing.s16),
            );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,

          child:
              ((widget.reservationModel.deletePeople != null &&
                          widget.reservationModel.deletePeople! == false) ||
                      widget.reservationModel.flightModel != null)
                  ? CustomGeneralFloatingButton(
                    onPressed: () {
                      bool isAllValid = true;

                      for (int i = 0; i < formKeys.length; i++) {
                        if (formKeys[i].currentState != null) {
                          if (formKeys[i].currentState!.validate()) {
                            if (widget.reservationModel.info![i].nationality !=
                                null) {
                              formKeys[i].currentState!.save();
                              strokeError[i] = false;
                              widget.reservationModel.hasError![i] = false;
                            } else {
                              isAllValid = false;
                              widget.reservationModel.hasError![i] = true;
                              strokeError[i] = true;
                            }
                          } else {
                            isAutoValidate[i] = AutovalidateMode.always;
                            isAllValid = false;
                            isAllValid = false;
                            if (widget.reservationModel.info![i].nationality ==
                                null) {
                              widget.reservationModel.hasError![i] = true;
                            }
                            strokeError[i] = true;
                          }
                        }
                      }
                      if (isAllValid) {
                      } else {}
                      setState(() {});
                    },
                    title: 'التالي',
                  )
                  : Container(height: 50, width: 50, color: Colors.amber),
        ),
      ],
    );
  }
}
