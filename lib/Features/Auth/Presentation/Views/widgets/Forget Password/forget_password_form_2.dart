import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_button.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/resend_code_timer_button.dart';

class ForgetPasswordForm2 extends StatefulWidget {
  const ForgetPasswordForm2({super.key});

  @override
  State<ForgetPasswordForm2> createState() => _ForgetPasswordForm2State();
}

class _ForgetPasswordForm2State extends State<ForgetPasswordForm2> {

 String? _code;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _errorController = StreamController<ErrorAnimationType>();
  bool _hasError = false;

  

  

  void _resendCode() {
    // TODO: استدعاء API لإعادة إرسال الكود
  }

  void _submitCode() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      GoRouter.of(context).pushNamed(AppRouter.kForgetPassword3Name);
      // TODO: تحقق من الكود
      print("رمز التحقق: $_code");
    } else {
      setState(() {
        log('a');
        _autovalidateMode = AutovalidateMode.always;
        _errorController.add(ErrorAnimationType.shake); // اهتزاز
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _autovalidateMode,
      key: _formKey,
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: PinCodeTextField(
              errorAnimationController: _errorController,
              enableActiveFill: true,
              boxShadows: null,
              hintCharacter: '0',
              hintStyle: AppStyles.fontsRegular24(
                context,
              ).copyWith(color: AppColors.graySwatch[500]),
              validator: Validation.validateEmptyPINField,
              length: 4,
              appContext: context,
              onChanged: (_) {},
              onCompleted: (val) {
                _code = val;
                setState(() {
                  _hasError = false;
                });
              },
              textStyle: AppStyles.fontsRegular24(
                context,
              ).copyWith(color: AppColors.titleTextColor),
              keyboardType: TextInputType.number,
              cursorColor: AppColors.titleTextColor,
              pinTheme: PinTheme(
                activeColor:
                    _hasError ? AppColors.red : AppColors.titleTextColor,
                inactiveColor:
                    _hasError ? AppColors.red : AppColors.graySwatch[50]!,
                selectedColor:
                    _hasError ? AppColors.red : AppColors.titleTextColor,
                activeBoxShadow: null,
                inActiveBoxShadow: null,
                errorBorderColor: AppColors.red,
                errorBorderWidth: 1,

                inactiveBorderWidth: 0,
                inactiveFillColor: AppColors.graySwatch[50]!,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 72,
                fieldWidth: 60,
                activeBorderWidth: 1,
                activeFillColor: AppColors.graySwatch[50]!,
                borderWidth: 1,
                selectedBorderWidth: 1,
                selectedFillColor: AppColors.graySwatch[50]!,
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            onPressed: _submitCode,
            title: 'التالي',
            icon: Assets.iconsArrow,
            iconColor: Colors.white,
            textStyle: AppStyles.fontsBold16(
              context,
            ).copyWith(color: Colors.white),
            borderRadius: 16,
            verPadding: 16,
            width: double.infinity,
          ),
          const SizedBox(height: AppSpacing.s16),
          ResendCodeTimerButton(
            onResend: _resendCode,
            activeColor: AppColors.primary,
            disabledColor: AppColors.graySwatch,
          ),
        ],
      ),
    );
  }
}