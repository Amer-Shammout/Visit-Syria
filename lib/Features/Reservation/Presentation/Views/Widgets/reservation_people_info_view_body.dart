import 'dart:developer';

import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/confirm_delete_dialog.dart';
import 'package:visit_syria/Core/widgets/custom_general_floating_button.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/event_and_trips_booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/passenger.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_info_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Manager/event_and_trip_booking_cubit/event_and_trips_booking_cubit.dart';
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
  //  List<GlobalKey<FormState>> formKeys = [];
  //  List<AutovalidateMode> isAutoValidate = [];
  // List<bool> strokeError = [];
  @override
  void initState() {
    super.initState();

    _setFirstPersonInfo();
    for (var i = 1; i < widget.reservationModel.info!.length; i++) {
      widget.reservationModel.info![i].nationality =
          widget.reservationModel.info![0].nationality;
    }
    //   widget.reservationModel.hasError = [];
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
    final AutovalidateMode isAutoValidate = AutovalidateMode.disabled;
    final GlobalKey<FormState> formKey = GlobalKey();
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: ReservationExpansionTile(
            initiallyExpanded: false,
            isAutoValidate: isAutoValidate,
            errorStroke: false,
            formKey: formKey,
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
            // if (formKeys.length <= index) {
            //   formKeys.add(GlobalKey<FormState>());
            // }
            // if (isAutoValidate.length <= index) {
            //   isAutoValidate.add(AutovalidateMode.disabled);
            // }
            // if (widget.reservationModel.hasError!.length <= index) {
            //   widget.reservationModel.hasError!.add(false);
            // }
            // if (strokeError.length <= index) {
            //   strokeError.add(false);
            // }
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
                        errorStroke:
                            widget.reservationModel.strokeError![index],
                        formKey: widget.reservationModel.formKeys![index],
                        isAutoValidate:
                            widget.reservationModel.isAutoValidate![index],
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
                                    widget.reservationModel.formKeys!.removeAt(
                                      index,
                                    );
                                    widget.reservationModel.isAutoValidate!
                                        .removeAt(index);
                                    widget.reservationModel.hasError!.removeAt(
                                      index,
                                    );
                                    widget.reservationModel.strokeError!
                                        .removeAt(index);
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
                    onPressed: () async {
                      bool isAllValid = checkValidate(context);
                      if (isAllValid) {
                        await bookEventOrTrip(context);
                      } else {
                        setState(() {});
                      }
                    },
                    title: 'التالي',
                  )
                  : SizedBox.shrink(),
        ),
      ],
    );
  }

  bool checkValidate(BuildContext context) {
    bool isAllValid = true;

    for (int i = 0; i < widget.reservationModel.formKeys!.length; i++) {
      if (widget.reservationModel.formKeys![i].currentState != null) {
        if (widget.reservationModel.formKeys![i].currentState!.validate()) {
          if (widget.reservationModel.info![i].nationality != null) {
            widget.reservationModel.formKeys![i].currentState!.save();
            widget.reservationModel.strokeError![i] = false;
            widget.reservationModel.hasError![i] = false;
          } else {
            isAllValid = false;
            widget.reservationModel.hasError![i] = true;
            widget.reservationModel.strokeError![i] = true;
          }
        } else {
          widget.reservationModel.isAutoValidate![i] = AutovalidateMode.always;
          isAllValid = false;
          isAllValid = false;
          if (widget.reservationModel.info![i].nationality == null) {
            widget.reservationModel.hasError![i] = true;
          }
          widget.reservationModel.strokeError![i] = true;
        }
      }
    }
    return isAllValid;
  }

  Future<void> bookEventOrTrip(BuildContext context) async {
    String type = '';
    int id = 0;
    if (widget.reservationModel.tripModel != null) {
      type = 'trip';
      id = widget.reservationModel.tripModel!.id!;
    }
    if (widget.reservationModel.eventModel != null) {
      type = 'event';
      id = widget.reservationModel.eventModel!.id!;
    }
    int tickets = widget.reservationModel.tickets!;
    List<Passenger> passengers = [];
    for (var i = 0; i < tickets; i++) {
      Passenger passenger = Passenger(
        firstName: widget.reservationModel.info![i].firstName,
        lastName: widget.reservationModel.info![i].lastName,
        birthDate: widget.reservationModel.info![i].birthDate,
        email: widget.reservationModel.info![i].email,
        gender: widget.reservationModel.info![i].gender,
        nationality: widget.reservationModel.info![i].nationality,
        phone: widget.reservationModel.info![i].phone,
        countryCode: widget.reservationModel.info![i].countryCode,
      );
      passengers.add(passenger);
    }
    EventAndTripsBookingModel reserve = EventAndTripsBookingModel(
      type: type,
      id: id,
      numberOfTickets: tickets,
      passengers: passengers,
    );
    await BlocProvider.of<EventAndTripsBookingCubit>(
      context,
    ).bookEventOrTrip(reserve);
    log(reserve.toString());
  }
}
