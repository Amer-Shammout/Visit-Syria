import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/airline_class_constants.dart';
import 'package:visit_syria/Core/constants/airports_constants.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_date_picker_field.dart';
import 'package:visit_syria/Core/widgets/custom_drop_down_form_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/airport_search_result_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_search_data.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/passenger_count_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/Views/Widgets/non_stop_switch.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Presentation/functions/build_text.dart';

class FlightSearchForm extends StatefulWidget {
  final FlightType type;

  const FlightSearchForm({super.key, required this.type});

  @override
  State<FlightSearchForm> createState() => _FlightSearchFormState();
}

class _FlightSearchFormState extends State<FlightSearchForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  final searchData = FlightSearchData();

  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _departureController = TextEditingController();
  final _returnController = TextEditingController();
  final _passengerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passengerController.text = buildPassengerText(searchData.passengers);
    if (widget.type == FlightType.fromSyria) {
      searchData.fromAirport = kAirports[0].value;
      searchData.direction = 'from_syria';
    } else if (widget.type == FlightType.toSyria) {
      searchData.toAirport = kAirports[0].value;
      searchData.direction = 'to_syria';
    } else {
      searchData.toAirport = kAirports[0].value;
      searchData.direction = 'both';
    }
  }

  @override
  void didUpdateWidget(covariant FlightSearchForm oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.type != widget.type) {
      searchData.fromAirport = null;
      searchData.toAirport = null;
      searchData.departureDate = null;
      searchData.returnDate = null;
      searchData.airlineClass = kAirlineClasses[0].value;
      searchData.nonStop = false;

      _fromController.clear();
      _toController.clear();
      _departureController.clear();
      _returnController.clear();

      if (widget.type == FlightType.fromSyria) {
        searchData.fromAirport = kAirports[0].value;
        searchData.direction = 'from_syria';
      } else if (widget.type == FlightType.toSyria) {
        searchData.toAirport = kAirports[0].value;
        searchData.direction = 'to_syria';
      } else {
        searchData.toAirport = kAirports[0].value;
        searchData.direction = 'both';
      }

      searchData.passengers = PassengerCountModel(
        adults: 1,
        children: 0,
        infants: 0,
      );
      _passengerController.text = buildPassengerText(searchData.passengers);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidate,
        child: Column(
          children: [
            if (widget.type == FlightType.fromSyria)
              CustomDropDownFormFieldWithLabel(
                label: 'من',
                value: searchData.fromAirport,
                items: kAirports,
                onChanged: (val) => searchData.fromAirport = val,
                validator: Validation.validateEmptyField,
                hint: '',
              )
            else
              CustomTextFieldWithLabel(
                controller: _fromController,
                label: 'من',
                readOnly: true,
                validator: Validation.validateEmptyField,
                onTap: () async {
                  final result = await selectAirport(
                    context,
                    "ما هي نقطة المغادرة",
                  );
                  if (result != null) {
                    searchData.fromAirport = result.iataCode;
                    _fromController.text =
                        "(${result.iataCode}) ${result.name}";
                  }
                },
                hint: 'كود المطار',
              ),

            const SizedBox(height: AppSpacing.s16),

            if (widget.type == FlightType.toSyria ||
                widget.type == FlightType.roundTrip)
              CustomDropDownFormFieldWithLabel(
                label: 'إلى',
                value: searchData.toAirport,
                items: kAirports,
                onChanged: (val) => searchData.toAirport = val,
                validator: Validation.validateEmptyField,
                hint: '',
              )
            else
              CustomTextFieldWithLabel(
                controller: _toController,
                label: 'إلى',
                readOnly: true,
                validator: Validation.validateEmptyField,
                onTap: () async {
                  final result = await selectAirport(
                    context,
                    "ما هي وجهة السفر",
                  );
                  if (result != null) {
                    searchData.toAirport = result.iataCode;
                    _toController.text = "(${result.iataCode}) ${result.name}";
                  }
                },
                hint: 'كود المطار',
              ),

            const SizedBox(height: AppSpacing.s16),

            Row(
              children: [
                Expanded(
                  child: CustomDatePickerField(
                    controller: _departureController,
                    label: "تاريخ المغادرة",
                    validator: Validation.validateEmptyField,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                    onDateSelected: (date) => searchData.departureDate = date,
                    hint: 'العام / الشهر / اليوم',
                    dateFormat: 'yyyy-MM-dd',
                  ),
                ),
                if (widget.type == FlightType.roundTrip) ...[
                  const SizedBox(width: AppSpacing.s12),
                  Expanded(
                    child: CustomDatePickerField(
                      hint: 'العام / الشهر / اليوم',
                      controller: _returnController,
                      label: "تاريخ العودة",
                      validator: Validation.validateEmptyField,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                      onDateSelected: (date) => searchData.returnDate = date,
                      dateFormat: 'yyyy-MM-dd',
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: AppSpacing.s16),

            Row(
              children: [
                Expanded(
                  child: CustomTextFieldWithLabel(
                    hint: "",
                    controller: _passengerController,
                    label: "المسافرين",
                    readOnly: true,
                    onTap: () async {
                      final result = await selectPassengers(
                        context,
                        searchData.passengers,
                      );
                      if (result != null) {
                        searchData.passengers = result;
                        _passengerController.text = buildPassengerText(result);
                      }
                    },
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: AppSpacing.s12),
                Expanded(
                  child: CustomDropDownFormFieldWithLabel<String>(
                    hint: "",
                    label: "الفئة",
                    value: kAirlineClasses[0].value,
                    items: kAirlineClasses,
                    onChanged: (val) => searchData.airlineClass = val,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.s16),

            NonStopSwitch(
              nonStop: searchData.nonStop,
              onChanged: (val) => setState(() => searchData.nonStop = val),
            ),

            const SizedBox(height: AppSpacing.s32),

            CustomButton(
              title: "بحث",
              icon: Assets.iconsSearch,
              iconColor: AppColors.whiteColor,
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: Colors.white),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  log(
                    "${searchData.airlineClass} , ${searchData.departureDate} , ${searchData.direction},${searchData.fromAirport} , ${searchData.max} , ${searchData.nonStop} , ${searchData.passengers.adults} ${searchData.returnDate} , ${searchData.toAirport}",
                  );
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRouter.kFlightsOffersName, extra: searchData);
                } else {
                  setState(() => _autoValidate = AutovalidateMode.always);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<AirportSearchResultModel?> selectAirport(
    BuildContext context,
    String question,
  ) {
    return GoRouter.of(context).pushNamed<AirportSearchResultModel>(
      AppRouter.kAirportSearchName,
      extra: question,
    );
  }

  Future<PassengerCountModel?> selectPassengers(
    BuildContext context,
    PassengerCountModel current,
  ) {
    return GoRouter.of(
      context,
    ).pushNamed<PassengerCountModel>(AppRouter.kPassangersName, extra: current);
  }
}
