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
  final data = FlightSearchData();

  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _departureController = TextEditingController();
  final _returnController = TextEditingController();
  final _passengerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passengerController.text = buildPassengerText(data.passengers);

    if (widget.type == FlightType.fromSyria) {
      data.fromAirport = kAirports[0].value;
    } else if (widget.type == FlightType.toSyria) {
      data.toAirport = kAirports[0].value;
    }
  }

  @override
  void didUpdateWidget(covariant FlightSearchForm oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.type != widget.type) {
      data.fromAirport = null;
      data.toAirport = null;
      data.departureDate = null;
      data.returnDate = null;
      data.airlineClass = kAirlineClasses[0].value;
      data.nonStop = false;

      _fromController.clear();
      _toController.clear();
      _departureController.clear();
      _returnController.clear();

      if (widget.type == FlightType.fromSyria) {
        data.fromAirport = kAirports[0].value;
      } else if (widget.type == FlightType.toSyria) {
        data.toAirport = kAirports[0].value;
      }

      data.passengers = PassengerCountModel(adults: 1, children: 0, infants: 0);
      _passengerController.text = buildPassengerText(data.passengers);

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
                value: data.fromAirport,
                items: kAirports,
                onChanged: (val) => data.fromAirport = val,
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
                    data.fromAirport = result.code;
                    _fromController.text = "(${result.code}) ${result.city}";
                  }
                },
                hint: 'كود المطار',
              ),

            const SizedBox(height: AppSpacing.s16),

            if (widget.type == FlightType.toSyria)
              CustomDropDownFormFieldWithLabel(
                label: 'إلى',
                value: data.toAirport,
                items: kAirports,
                onChanged: (val) => data.toAirport = val,
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
                    data.toAirport = result.code;
                    _toController.text = "(${result.code}) ${result.city}";
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
                    onDateSelected: (date) => data.departureDate = date,
                    hint: 'العام / الشهر / اليوم',
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
                      onDateSelected: (date) => data.returnDate = date,
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
                        data.passengers,
                      );
                      if (result != null) {
                        data.passengers = result;
                        _passengerController.text = buildPassengerText(result);
                      }
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.s12),
                Expanded(
                  child: CustomDropDownFormFieldWithLabel<String>(
                    hint: "",
                    label: "الفئة",
                    value: kAirlineClasses[0].value,
                    items: kAirlineClasses,
                    onChanged: (val) => data.airlineClass = val,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.s16),

            NonStopSwitch(
              nonStop: data.nonStop,
              onChanged: (val) => setState(() => data.nonStop = val),
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
