import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:visit_syria/Core/widgets/custom_country_picker.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';

class CountryPickerField extends StatefulWidget {
  final ValueChanged<Country> onSelect;
  final ReservationModel reservationModel;
  final int index;
  const CountryPickerField({
    super.key,

    required this.onSelect,
    required this.reservationModel,
    required this.index,
  });

  @override
  State<CountryPickerField> createState() => _CountryPickerFieldState();
}

class _CountryPickerFieldState extends State<CountryPickerField> {
  Country? selectedCountry;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCountryPicker(
      hasError:
          widget.reservationModel.hasError?[widget.index] != null
              ? widget.reservationModel.hasError![widget.index]
              : false,
      selectedCountry: selectedCountry,

      onSelect: (country) {
        setState(() {
          selectedCountry = country;
          widget.reservationModel.hasError![widget.index] = false;
        });
        widget.onSelect(country);
      },
    );
  }
}
