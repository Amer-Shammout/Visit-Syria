import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';

class CustomCountryPicker extends StatelessWidget {
  const CustomCountryPicker({
    super.key,
    required Country? selectedCountry,
    required this.onSelect,
    required this.hasError,
    this.initialCountry,
  }) : _selectedCountry = selectedCountry;

  final Country? _selectedCountry;
  final bool hasError;
  final void Function(Country) onSelect;
  final Country? initialCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'البلد',
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        SizedBox(height: AppSpacing.s4),
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              favorite: ['SY', 'SA', 'AE'],
              onSelect: onSelect,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.graySwatch[50],

              border: Border.all(
                color: hasError ? AppColors.redSwatch : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _selectedCountry != null || initialCountry != null
                        ? Text(
                          _selectedCountry?.flagEmoji ??
                              initialCountry!.flagEmoji,
                          style: TextStyle(fontSize: 16),
                        )
                        : SizedBox.shrink(),
                    SizedBox(width: AppSpacing.s4),
                    Text(
                      _selectedCountry != null ||
                              GetProfileCubit.userModel?.me?.profile?.country !=
                                  null ||
                              initialCountry != null
                          ? _selectedCountry?.name ??
                              GetProfileCubit.userModel?.me?.profile?.country ??
                              initialCountry!.name
                          : 'اختر البلد',
                      style: AppStyles.fontsRegular16(
                        context,
                      ).copyWith(color: AppColors.titleTextColor),
                    ),
                  ],
                ),

                SvgPicture.asset(
                  Assets.iconsArrowDropDown,
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.titleTextColor,
                    BlendMode.srcATop,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
