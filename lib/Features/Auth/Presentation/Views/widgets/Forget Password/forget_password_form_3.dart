import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';
// ignore: unused_import
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Auth/Data/Models/reset_password_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/reset_password_cubit/reset_password_cubit.dart';

class ForgetPasswordForm3 extends StatefulWidget {
  const ForgetPasswordForm3({super.key, required this.verificationModel});

  final VerificationModel verificationModel;

  @override
  State<ForgetPasswordForm3> createState() => _ForgetPasswordForm3State();
}

class _ForgetPasswordForm3State extends State<ForgetPasswordForm3> {
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? password;
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ResetPasswordModel resetPasswordModel = ResetPasswordModel(
        code: widget.verificationModel.code,
        email: widget.verificationModel.email,
        password: password,
      );
      await BlocProvider.of<ResetPasswordCubit>(
        context,
      ).resetPassword(resetPasswordModel);
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
      });
    }
  }

  @override
  void dispose() {
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _isAutoValidate,
      child: Column(
        children: [
          CustomTextFieldWithLabel(
            enableInteractiveSelection: false,
            onSaved: (val) => password = val,
            onChanged: (val) => password = val,
            validator: Validation.validatePasswordComplex,
            maxLines: 1,
            hint: 'Password',
            label: 'كلمة المرور الجديدة',
            helperText:
                "يجب أن تحتوي كلمة المرور على أحرف كبيرة وصغيرة و رموز مميزة",
            obscureText: _obscurePassword1,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                _obscurePassword1
                    ? Assets.iconsEyeClosed
                    : Assets.iconsEyeOpened,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.graySwatch[500]!,
                  BlendMode.srcATop,
                ),
              ),
              onPressed: eyeToggle1,
            ),
            focusNode: _passwordFocus,
            textInputAction: TextInputAction.next,
            onEditingComplete:
                () =>
                    FocusScope.of(context).requestFocus(_confirmPasswordFocus),
          ),
          const SizedBox(height: AppSpacing.s16),
          CustomTextFieldWithLabel(
            enableInteractiveSelection: false,
            validator:
                (val) => Validation.validateConfirmPassword(val, password),
            maxLines: 1,
            hint: 'Password',
            label: 'تأكيد كلمة المرور الجديدة',
            obscureText: _obscurePassword2,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                _obscurePassword2
                    ? Assets.iconsEyeClosed
                    : Assets.iconsEyeOpened,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.graySwatch[500]!,
                  BlendMode.srcATop,
                ),
              ),
              onPressed: eyeToggle2,
            ),
            focusNode: _confirmPasswordFocus,
            textInputAction: TextInputAction.done,
            onEditingComplete: () => FocusScope.of(context).unfocus(),
          ),

          const SizedBox(height: AppSpacing.s16),
          CustomButton(
            onPressed: _submit,
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            title: 'تأكيد',
            textStyle: AppStyles.fontsBold16(
              context,
            ).copyWith(color: AppColors.whiteColor),
            borderRadius: 16,
            verPadding: 16,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  void eyeToggle1() {
    setState(() {
      _obscurePassword1 = !_obscurePassword1;
    });
  }

  void eyeToggle2() {
    setState(() {
      _obscurePassword2 = !_obscurePassword2;
    });
  }
}
