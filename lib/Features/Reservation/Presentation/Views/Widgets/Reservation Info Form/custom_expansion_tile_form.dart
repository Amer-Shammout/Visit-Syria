import 'package:country_picker/country_picker.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:visit_syria/Core/constants/gender_constants.dart';
import 'package:visit_syria/Core/data/Enums/enum.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_date_picker_field.dart';
import 'package:visit_syria/Core/widgets/custom_drop_down_form_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_phone_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_info_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/Reservation%20Info%20Form/country_picker_field.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Views/Widgets/Reservation%20Info%20Form/passport_section.dart';

class CustomExpansionTileForm extends StatefulWidget {
  const CustomExpansionTileForm({
    super.key,
    required this.reservationModel,
    required this.index,
    required this.formKey,
    required this.isAutoValidate,
  });

  final ReservationModel reservationModel;
  final int index;
  final GlobalKey<FormState> formKey;
  final AutovalidateMode isAutoValidate;

  @override
  State<CustomExpansionTileForm> createState() =>
      _CustomExpansionTileFormState();
}

class _CustomExpansionTileFormState extends State<CustomExpansionTileForm> {
  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _phoneNumberFocus = FocusNode();
  final _passportNumberFocus = FocusNode();
  final ReservationInfoModel info = ReservationInfoModel();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Country? selectedCountry;

  DateTime firstDate = DateTime(
    DateTime.now().year,
    DateTime.now().month + 6,
    DateTime.now().day,
  );
  DateTime lastDate = DateTime(
    DateTime.now().year + 10,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  void initState() {
    super.initState();
    if (widget.reservationModel.info![widget.index].birthDate != null) {
      _birthDateController.text =
          widget.reservationModel.info![widget.index].birthDate!;
    }
    if (widget.reservationModel.info![widget.index].phone != null) {
      _phoneController.text =
          widget.reservationModel.info![widget.index].phone!;
    }
  }

  @override
  void dispose() {
    _birthDateController.dispose();

    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _phoneNumberFocus.dispose();
    _passportNumberFocus.dispose();
    super.dispose();
  }

  static String? validateEmptyPhone(
    PhoneNumber? phone,
    TextEditingController controller,
  ) {
    final text = phone?.number ?? controller.text;
    if (text.isEmpty) return 'مطلوب';
    return null;
  }

  String? Function(String?) get passportDateExpiryValidator {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return Validation.validateEmptyField(
          widget.reservationModel.info![widget.index].passportExpiryDate,
        );
      }
      return null;
    };
  }

  String? Function(String?) get birthDateValidator {
    return (String? value) {
      if (widget.reservationModel.info![widget.index].birthDate == null) {
        return Validation.validateEmptyField(
          widget.reservationModel.info![widget.index].birthDate,
        );
      }
      if (widget.reservationModel.flightModel != null) {
        // إذا في رحلة
        switch (widget.reservationModel.ageState![widget.index]) {
          case AgeStateEnum.adult:
            return Validation.validateAdultAge(
              widget.reservationModel.info![widget.index].birthDate,
            );
          case AgeStateEnum.child:
            return Validation.validatChildAge(
              widget.reservationModel.info![widget.index].birthDate,
            );
          case AgeStateEnum.infant:
            return Validation.validateInfantAge(
              widget.reservationModel.info![widget.index].birthDate,
            );
        }
      } else {
        // إذا ما في رحلة
        if (widget.index == 0) {
          return Validation.validateAdultAge(
            widget.reservationModel.info![widget.index].birthDate,
          );
        }
        if (widget.index != 0) {
          return Validation.validatePersonAge(
            widget.reservationModel.info![widget.index].birthDate,
          );
        }
      }
      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.isAutoValidate,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextFieldWithLabel(
                    initialValue:
                        widget.reservationModel.info![widget.index].firstName,
                    hint:
                        widget.reservationModel.info![widget.index].firstName !=
                                null
                            ? " "
                            : "أحمد",
                    label: "الاسم الأول",
                    validator: Validation.validateEmptyField,
                    onChanged: (firstName) {
                      if (firstName.isEmpty) {
                        widget.reservationModel.info![widget.index].firstName =
                            null;
                      } else {
                        widget.reservationModel.info![widget.index].firstName =
                            firstName;
                      }
                    },
                    onSaved: (firstName) {
                      if (firstName == null) {
                        widget.reservationModel.info![widget.index].firstName =
                            null;
                      } else if (firstName.isEmpty) {
                        widget.reservationModel.info![widget.index].firstName =
                            null;
                      } else {
                        widget.reservationModel.info![widget.index].firstName =
                            firstName;
                      }
                    },
                    focusNode: _firstNameFocus,
                    textInputAction: TextInputAction.next,
                    onEditingComplete:
                        () =>
                            FocusScope.of(context).requestFocus(_lastNameFocus),
                  ),
                ),
                const SizedBox(width: AppSpacing.s12),
                Expanded(
                  child: CustomTextFieldWithLabel(
                    initialValue:
                        widget.reservationModel.info![widget.index].lastName,
                    hint:
                        widget.reservationModel.info![widget.index].lastName !=
                                null
                            ? " "
                            : "محسن",
                    label: "الاسم الأخير",
                    validator: Validation.validateEmptyField,
                    onChanged: (lastName) {
                      if (lastName.isEmpty) {
                        widget.reservationModel.info![widget.index].lastName =
                            null;
                      } else {
                        widget.reservationModel.info![widget.index].lastName =
                            lastName;
                      }
                    },
                    onSaved: (lastName) {
                      if (lastName == null) {
                        widget.reservationModel.info![widget.index].lastName =
                            null;
                      } else if (lastName.isEmpty) {
                        widget.reservationModel.info![widget.index].lastName =
                            null;
                      } else {
                        widget.reservationModel.info![widget.index].lastName =
                            lastName;
                      }
                    },
                    focusNode: _lastNameFocus,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => FocusScope.of(context).unfocus(),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.s16),
            CustomDropDownFormFieldWithLabel<String>(
              validator: Validation.validateEmptyField,
              label: "الجنس",
              value:
                  widget.reservationModel.info![widget.index].gender != null
                      ? widget.reservationModel.info![widget.index].gender! ==
                              'male'
                          ? "male"
                          : widget
                                  .reservationModel
                                  .info![widget.index]
                                  .gender! ==
                              'female'
                          ? "female"
                          : null
                      : null,

              hint: "اختر الجنس",
              items: kGenderDropdownItems,
              onChanged: (gender) {
                widget.reservationModel.info![widget.index].gender = gender;
              },
              onSaved: (gender) {
                widget.reservationModel.info![widget.index].gender = gender;
              },
            ),
            SizedBox(height: AppSpacing.s16),
            CustomDatePickerField(
              validator: birthDateValidator,
              initialDate:
                  widget.reservationModel.info![widget.index].birthDate != null
                      ? DateTime.parse(
                        widget.reservationModel.info![widget.index].birthDate!,
                      )
                      : null,
              controller: _birthDateController,
              hint:
                  widget.reservationModel.info![widget.index].birthDate != null
                      ? ""
                      : 'العام / الشهر / اليوم',
              label: "تاريخ الولادة",
              onDateSelected: (date) {
                widget.reservationModel.info![widget.index].birthDate = date;
              },
              dateFormat: 'yyyy-MM-dd',
            ),
            SizedBox(height: AppSpacing.s16),
            CountryPickerField(
              reservationModel: widget.reservationModel,
              index: widget.index,

              onSelect: (country) {
                widget.reservationModel.info![widget.index].nationality =
                    country.name;
              },
            ),

            SizedBox(height: AppSpacing.s16),
            widget.reservationModel.flightModel != null
                ? PassportSection(
                  reservationModel: widget.reservationModel,
                  index: widget.index,
                )
                : SizedBox.shrink(),
            if (widget.index == 0) ...[
              CustomTextFieldWithLabel(
                readOnly: true,
                isEnabled: false,
                initialValue: widget.reservationModel.info![widget.index].email,
                label: "البريد الالكتروني",
                hint:
                    widget.reservationModel.info![widget.index].email != null
                        ? " "
                        : "example@gmail.com",
              ),
              SizedBox(height: AppSpacing.s16),
              CustomPhoneFieldWithLabel(
                controller: _phoneController,
                validator:
                    (phone) => validateEmptyPhone(phone, _phoneController),
                focusNode: _phoneNumberFocus,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
                initialCountyCode:
                    widget.reservationModel.info![widget.index].isoCode,
                initialValue:
                    widget.reservationModel.info![widget.index].countryCode !=
                                null &&
                            widget.reservationModel.info![widget.index].phone !=
                                null
                        ? PhoneNumber(
                          countryISOCode:
                              widget
                                  .reservationModel
                                  .info![widget.index]
                                  .countryCode!,
                          countryCode:
                              widget
                                  .reservationModel
                                  .info![widget.index]
                                  .countryCode!,
                          number:
                              widget
                                  .reservationModel
                                  .info![widget.index]
                                  .phone!,
                        )
                        : null,
                label: "رقم الهاتف",
                hint:
                    widget.reservationModel.info![widget.index].countryCode !=
                                null &&
                            widget.reservationModel.info![widget.index].phone !=
                                null
                        ? ""
                        : "00000000",
                onChanged: (phone) {
                  widget.reservationModel.info![widget.index].countryCode =
                      phone.countryCode;
                  widget.reservationModel.info![widget.index].phone =
                      phone.number;
                  widget.reservationModel.info![widget.index].countryISOCode =
                      phone.countryISOCode;
                  widget.reservationModel.info![widget.index].isoCode =
                      CountryPickerUtils.getCountryByPhoneCode(
                        phone.countryCode.substring(1),
                      ).isoCode;
                },
                onSaved: (phone) {
                  if (phone != null) {
                    widget.reservationModel.info![widget.index].countryCode =
                        phone!.countryCode;
                    widget.reservationModel.info![widget.index].phone =
                        phone.number;
                    widget.reservationModel.info![widget.index].countryISOCode =
                        phone.countryISOCode;
                    widget.reservationModel.info![widget.index].isoCode =
                        CountryPickerUtils.getCountryByPhoneCode(
                          phone.countryCode.substring(1),
                        ).isoCode;
                  }
                },
              ),
              SizedBox(height: AppSpacing.s16),
            ],
          ],
        ),
      ),
    );
  }
}
