import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/resend_code_cubit/resend_code_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/verify_email_cubit/verify_email_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/resend_code_timer_button.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({super.key, required this.authModel});

  final AuthRequestModel authModel;

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  String? _code;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _errorController = StreamController<ErrorAnimationType>();
  bool _hasError = false;

  void _resendCode() async {
    await BlocProvider.of<ResendCodeCubit>(
      context,
    ).resendCode(widget.authModel.email!);
  }

  void _submitCode() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      log(_code ?? "");
      VerificationModel verificationModel = VerificationModel(
        code: _code,
        email: widget.authModel.email,
      );
      await BlocProvider.of<VerifyEmailCubit>(
        context,
      ).verifyEmail(verificationModel);
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
                fieldOuterPadding: EdgeInsets.symmetric(horizontal: 8),
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
