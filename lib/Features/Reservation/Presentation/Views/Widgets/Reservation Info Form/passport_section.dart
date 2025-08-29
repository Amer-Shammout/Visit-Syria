import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_date_picker_field.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';

class PassportSection extends StatefulWidget {
  const PassportSection({
    super.key,
    required this.reservationModel,
    required this.index,
  });

  final ReservationModel reservationModel;
  final int index;

  @override
  State<PassportSection> createState() => _PassportSectionState();
}

class _PassportSectionState extends State<PassportSection> {
  final TextEditingController _passportExpiryDateController =
      TextEditingController();

  late final DateTime firstDate;
  late final DateTime lastDate;

  @override
  void initState() {
    super.initState();
    if (widget.reservationModel.info![widget.index].passportExpiryDate !=
        null) {
      _passportExpiryDateController.text =
          widget.reservationModel.info![widget.index].passportExpiryDate!;
    }

    firstDate = DateTime(
      DateTime.now().year,
      DateTime.now().month + 6,
      DateTime.now().day,
    );

    lastDate = DateTime(
      DateTime.now().year + 10,
      DateTime.now().month,
      DateTime.now().day,
    );
  }

  @override
  void dispose() {
    _passportExpiryDateController.dispose();
    super.dispose();
  }

  String? passportDateExpiryValidator(String? value) {
    final text = _passportExpiryDateController.text;

    if (text.isEmpty) {
      return 'الرجاء إدخال تاريخ انتهاء الجواز';
    }

    final parsedDate = DateTime.tryParse(text);
    if (parsedDate == null) {
      return 'التاريخ غير صالح';
    }

    return null;
  }

  String? Function(String?) get passportDateValidator {
    return (String? value) {
      if (widget.reservationModel.info![widget.index].passportExpiryDate ==
          null) {
        return Validation.validateEmptyField(
          widget.reservationModel.info![widget.index].passportExpiryDate,
        );
      }
      return null;
    };
  }

  String? _passportNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم الجواز';
    }

    // الطول لازم يكون بين 6 و 12 خانة
    if (value.length < 6 || value.length > 12) {
      return 'رقم الجواز يجب أن يتكون من 6 إلى 12 خانة';
    }

    // لازم يبدأ بحروف (0–3 حروف) وبعدهم أرقام
    final regex = RegExp(r'^[A-Za-z]{0,3}[0-9]+$');
    if (!regex.hasMatch(value)) {
      return 'رقم الجواز يجب أن يبدأ بحروف (اختياري) ثم أرقام فقط';
    }

    return null; // صحيح ✅
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWithLabel(
          initialValue:
              widget.reservationModel.info![widget.index].passportNumber,
          hint:
              widget.reservationModel.info![widget.index].passportNumber != null
                  ? ""
                  : "N12345678",
          label: "رقم الجواز",
          validator: _passportNumberValidator,
          onChanged: (passportNo) {
            if (passportNo.isEmpty) {
              widget.reservationModel.info![widget.index].passportNumber = null;
            } else {
              widget.reservationModel.info![widget.index].passportNumber =
                  passportNo;
            }
          },
          onSaved: (passportNo) {
            if (passportNo == null) {
              widget.reservationModel.info![widget.index].passportNumber = null;
            } else if (passportNo.isEmpty) {
              widget.reservationModel.info![widget.index].passportNumber = null;
            } else {
              widget.reservationModel.info![widget.index].passportNumber =
                  passportNo;
            }
          },
        ),
        const SizedBox(height: AppSpacing.s16),
        CustomDatePickerField(
          validator: passportDateExpiryValidator,
          firstDate: firstDate,
          lastDate: lastDate,
          initialDate:
              widget.reservationModel.info![widget.index].passportExpiryDate !=
                      null
                  ? DateTime.tryParse(
                    widget
                        .reservationModel
                        .info![widget.index]
                        .passportExpiryDate!,
                  )
                  : firstDate,
          controller: _passportExpiryDateController,
          hint:
              widget.reservationModel.info![widget.index].passportExpiryDate !=
                      null
                  ? ""
                  : 'العام / الشهر / اليوم',
          label: "تاريخ انتهاء الجواز",
          onDateSelected: (date) {
            widget.reservationModel.info![widget.index].passportExpiryDate =
                date.toString();
            _passportExpiryDateController.text = date.toString();
          },
          dateFormat: 'yyyy-MM-dd',
        ),
        const SizedBox(height: AppSpacing.s16),
      ],
    );
  }
}
