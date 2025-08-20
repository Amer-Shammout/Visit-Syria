import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:visit_syria/Core/widgets/custom_country_picker.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';

class CountryPickerField extends StatefulWidget {
  final String? initialCountryName;
  final ValueChanged<Country> onSelect;
  final ReservationModel reservationModel;
  final int index;
  const CountryPickerField({
    super.key,
    this.initialCountryName,
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
    if (widget.initialCountryName != null) {
      // إذا بدك تملأ البلد الافتراضي
      selectedCountry = Country.parse(widget.initialCountryName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomCountryPicker(
      hasError: widget.reservationModel.hasError![widget.index],
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
