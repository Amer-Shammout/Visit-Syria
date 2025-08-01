import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/airports_constants.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_date_picker_field.dart';
import 'package:visit_syria/Core/widgets/custom_drop_down_form_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/airport_search_result_model.dart';

class ToAndFromSyriaForm extends StatefulWidget {
  const ToAndFromSyriaForm({super.key});

  @override
  State<ToAndFromSyriaForm> createState() => _ToAndFromSyriaFormState();
}

class _ToAndFromSyriaFormState extends State<ToAndFromSyriaForm> {
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? source, destination;
  final TextEditingController _deperatureDateController =
      TextEditingController();
  final TextEditingController _returnDateController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  String? deperatureDate, returnDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        autovalidateMode: _isAutoValidate,
        child: Column(
          children: [
            CustomTextFieldWithLabel(
              controller: _destinationController,
              hint: 'كود المطار',
              label: 'من',
              onSaved: (val) => destination = val,
              validator: Validation.validateEmptyField,
              readOnly: true,
              onTap: () async {
                final selectedAirport = await GoRouter.of(
                  context,
                ).pushNamed<AirportSearchResultModel>(
                  AppRouter.kAirportSearchName,
                  extra: "ما هي نقطة المغادرة ",
                );
                if (selectedAirport != null) {
                  setState(() {
                    destination = selectedAirport.code;
                    _destinationController.text =
                        "(${selectedAirport.code}) ${selectedAirport.city}";
                  });
                }
              },
            ),
            CustomDropDownFormFieldWithLabel(
              items: kAirports,
              hint: '',
              label: 'إلى',
              value: kAirports[0].value,
              onSaved: (val) => source = val,
              onChanged:
                  (val) => setState(() {
                    source = val;
                  }),
              validator: Validation.validateEmptyField,
            ),
            const SizedBox(height: AppSpacing.s16),
            Row(
              children: [
                Expanded(
                  child: CustomDatePickerField(
                    validator: Validation.validateEmptyField,
                    controller: _deperatureDateController,
                    hint: 'العام / الشهر / اليوم',
                    label: "تاريخ المغادرة",
                    firstDate: DateTime.now(),
                    lastDate: DateTime(
                      DateTime.now().year + 1,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                    onDateSelected:
                        (date) => setState(() {
                          deperatureDate = date;
                        }),
                  ),
                ),
                SizedBox(width: AppSpacing.s12),
                Expanded(
                  child: CustomDatePickerField(
                    validator: Validation.validateEmptyField,
                    controller: _returnDateController,
                    hint: 'العام / الشهر / اليوم',
                    label: "تاريخ العودة",
                    firstDate: DateTime.now(),
                    lastDate: DateTime(
                      DateTime.now().year + 1,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                    onDateSelected:
                        (date) => setState(() {
                          returnDate = date;
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
