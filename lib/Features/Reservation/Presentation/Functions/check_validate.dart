import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';

bool checkValidate(BuildContext context, ReservationModel reservationModel) {
  bool isAllValid = true;

  for (int i = 0; i < reservationModel.formKeys!.length; i++) {
    if (reservationModel.formKeys![i].currentState != null) {
      if (reservationModel.formKeys![i].currentState!.validate()) {
        if (reservationModel.info![i].nationality != null) {
          reservationModel.formKeys![i].currentState!.save();
          reservationModel.strokeError![i] = false;
          reservationModel.hasError![i] = false;
        } else {
          isAllValid = false;
          reservationModel.hasError![i] = true;
          reservationModel.strokeError![i] = true;
        }
      } else {
        reservationModel.isAutoValidate![i] = AutovalidateMode.always;
        isAllValid = false;
        isAllValid = false;
        if (reservationModel.info![i].nationality == null) {
          reservationModel.hasError![i] = true;
        }
        reservationModel.strokeError![i] = true;
      }
    }
  }
  return isAllValid;
}
