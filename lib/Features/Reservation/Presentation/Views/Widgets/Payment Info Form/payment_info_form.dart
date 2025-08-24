import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/month_constants.dart';
import 'package:visit_syria/Core/constants/years.contants.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/confirm_delete_dialog.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_drop_down_form_field_with_label.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Functions/card_number_mask_formatter.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Functions/get_validate_month_value.dart';

class PaymentInfoForm extends StatefulWidget {
  const PaymentInfoForm({super.key, required this.bookingModel});

  final BookingModel bookingModel;
  @override
  State<PaymentInfoForm> createState() => _PaymentInfoFormState();
}

class _PaymentInfoFormState extends State<PaymentInfoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode isAutoValidate = AutovalidateMode.disabled;
  final FocusNode _cardNameFocus = FocusNode();
  final FocusNode _cardNumberFocus = FocusNode();
  final FocusNode _cardCVCFocus = FocusNode();
  final cardFormatter = CardNumberFormatter();
  String? cardName, cardNumber, cardCVC, expMonth, expYear;
  @override
  void dispose() {
    super.dispose();
    _cardNameFocus.dispose();
    _cardNumberFocus.dispose();
    _cardCVCFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'بطاقة الائتمان',
              style: AppStyles.fontsBold24(
                context,
              ).copyWith(color: AppColors.titleTextColor),
            ),
            SizedBox(height: AppSpacing.s32),
            CustomTextFieldWithLabel(
              onSaved: (value) {
                cardName = value;
              },
              onChanged: (value) {
                cardName = value;
              },
              focusNode: _cardNameFocus,
              textInputAction: TextInputAction.next,
              onEditingComplete:
                  () => FocusScope.of(context).requestFocus(_cardNumberFocus),
              validator: Validation.validateEmptyField,
              hint: 'Ahmad Mohsen',
              label: 'اسم صاحب البطاقة',
            ),
            SizedBox(height: AppSpacing.s16),
            CustomTextFieldWithLabel(
              onSaved: (value) {
                cardNumber = cardFormatter.realText;
              },
              onChanged: (value) {
                cardNumber = cardFormatter.realText;
                log(cardNumber!);
              },
              focusNode: _cardNumberFocus,
              textInputAction: TextInputAction.next,
              onEditingComplete:
                  () => FocusScope.of(context).requestFocus(_cardCVCFocus),
              validator: Validation.validateEmptyField,
              inputFormatter: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                cardFormatter,
              ],
              hint: 'XXXX XXXX XXXX XXXX',
              label: 'رقم البطاقة',

              keyboardType: TextInputType.number,
            ),
            SizedBox(height: AppSpacing.s16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextFieldWithLabel(
                    maxLines: 1,
                    obscureText: true,
                    onSaved: (value) {
                      cardCVC = value;
                    },
                    onChanged: (value) {
                      cardCVC = value;
                    },
                    focusNode: _cardCVCFocus,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => FocusScope.of(context).unfocus(),
                    inputFormatter: [LengthLimitingTextInputFormatter(4)],
                    validator: Validation.validateCVC,
                    hint: 'CVC',
                    label: 'رقم التحقق',
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 32),
                Expanded(
                  child: CustomDropDownFormFieldWithLabel<String>(
                    validator: Validation.validateEmptyField,
                    label: "الشهر",
                    value: getValidMonthValue(
                      expMonth: expMonth,
                      expYear: expYear,
                    ),

                    hint: "اختر الشهر",
                    items: kBuildMonthsDropdownItems(
                      expYear ?? DateTime.now().year.toString(),
                    ),
                    onChanged: (month) {
                      expMonth = month;
                    },
                    onSaved: (month) {
                      expMonth = month;
                    },
                  ),
                ),
                SizedBox(width: 4),
                Expanded(
                  child: CustomDropDownFormFieldWithLabel<String>(
                    validator: Validation.validateEmptyField,
                    label: "السنة",
                    value: expYear,
                    hint: "اختر السنة",
                    items: buildYearDropdownItems(),
                    onChanged: (year) {
                      expYear = year;
                      setState(() {});
                    },
                    onSaved: (year) {
                      expYear = year;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.s32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: CustomButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomConfirmDialog(
                            confirmColor: AppColors.primary,
                            confirmTitle: 'تأكيد',
                            onPressed: () {
                              if (_formKey.currentState != null) {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  log(cardName!);
                                  log(cardNumber!);
                                  log(cardCVC!);
                                  log(expMonth!);
                                  log(expYear!);
                                } else {
                                  isAutoValidate = AutovalidateMode.always;
                                  GoRouter.of(context).pop();
                                }
                              }
                            },
                            text: 'هل أنت متأكد من عملية الدفع؟',
                          );
                        },
                      );
                    },
                    title: "ادفع",
                    textStyle: AppStyles.fontsBold14(
                      context,
                    ).copyWith(color: AppColors.whiteColor),
                    borderRadius: 16,
                    verPadding: 12,
                    icon: Assets.iconsArrow,
                    iconColor: AppColors.whiteColor,
                    size: 16,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "السعر",
                            style: AppStyles.fontsRegular14(
                              context,
                            ).copyWith(color: AppColors.graySwatch[700]),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: AppSpacing.s4),
                          Text(
                            widget.bookingModel.booking!.price.toString(),
                            textDirection: TextDirection.ltr,
                            style: AppStyles.fontsBold20(
                              context,
                            ).copyWith(color: AppColors.titleTextColor),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ],
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
