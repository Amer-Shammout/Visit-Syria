import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_expanstion_tile.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/passenger.dart';

class CustomMyReservationInfoSection extends StatelessWidget {
  const CustomMyReservationInfoSection({
    super.key,
    required this.passengers,
    required this.isFlight,
  });
  final List<Passenger> passengers;
  final bool isFlight;
  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: 'معلومات الحجز',
      hasSeeAll: false,
      widgets: [
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder:
              (context, index) => CustomExpansionTile(
                titleTextStyle: AppStyles.fontsBold18(
                  context,
                ).copyWith(color: AppColors.titleTextColor),
                title:
                    '${passengers[index].firstName} ${passengers[index].lastName}',
                icon: Assets.iconsTrips,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomTextFieldWithLabel(
                                isEnabled: false,
                                readOnly: true,
                                initialValue: passengers[index].firstName,
                                hint: '',
                                label: "الاسم الأول",
                              ),
                            ),
                            const SizedBox(width: AppSpacing.s12),
                            Expanded(
                              child: CustomTextFieldWithLabel(
                                isEnabled: false,
                                readOnly: true,
                                initialValue: passengers[index].lastName,
                                hint: '',
                                label: "الاسم الأخير",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSpacing.s16),
                        CustomTextFieldWithLabel(
                          isEnabled: false,
                          readOnly: true,
                          initialValue:
                              passengers[index].gender == 'male'
                                  ? 'ذكر'
                                  : 'أنثى',
                          hint: '',
                          label: 'الجنس',
                        ),

                        SizedBox(height: AppSpacing.s16),

                        CustomTextFieldWithLabel(
                          isEnabled: false,
                          readOnly: true,
                          initialValue: passengers[index].birthDate,
                          hint: '',
                          label: 'تاريخ الولادة',
                        ),

                        SizedBox(height: AppSpacing.s16),
                        CustomTextFieldWithLabel(
                          isEnabled: false,
                          readOnly: true,
                          initialValue: passengers[index].nationality,
                          hint: '',
                          label: 'البلد',
                        ),

                        if (isFlight) ...[
                          SizedBox(height: AppSpacing.s16),
                          CustomTextFieldWithLabel(
                            isEnabled: false,
                            readOnly: true,
                            initialValue: passengers[index].passportNumber,
                            hint: '',
                            label: 'رقم الجواز',
                          ),
                          SizedBox(height: AppSpacing.s16),
                          CustomTextFieldWithLabel(
                            isEnabled: false,
                            readOnly: true,
                            initialValue: passengers[index].passportExpiryDate,
                            hint: '',
                            label: 'تاريخ انتهاء الجواز',
                          ),
                        ],

                        if (index == 0) ...[
                          SizedBox(height: AppSpacing.s16),
                          CustomTextFieldWithLabel(
                            isEnabled: false,
                            readOnly: true,

                            initialValue: passengers[0].email,

                            label: "البريد الالكتروني",
                            hint: '',
                          ),
                          SizedBox(height: AppSpacing.s16),
                          CustomTextFieldWithLabel(
                            isEnabled: false,
                            readOnly: true,

                            initialValue:
                                '${passengers[0].phone} ${passengers[0].countryCode!.substring(1)}+',

                            label: 'رقم الهاتف',
                            hint: '',
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
          separatorBuilder: (context, index) => SizedBox(height: AppSpacing.s8),
          itemCount: passengers.length,
        ),
      ],
    );
  }
}
