import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/widgets/custom_button.dart';
import 'package:visit_syria/Core/utils/widgets/custom_text_button.dart';
import 'package:visit_syria/Core/utils/widgets/custom_text_field_with_label.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? email;
  String? password;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: handle login logic with email and password
      print('Email: \$email, Password: \$password');
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _isAutoValidate,
      child: Column(
        children: [
          CustomTextFieldWithLabel(
            hint: 'Email',
            label: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            onSaved: (val) => email = val,
            validator: (val) {
              if (val == null || val.trim().isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              } else if (!EmailValidator.validate(val.trim())) {
                return 'البريد الإلكتروني غير صالح';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.s16),
          CustomTextFieldWithLabel(
            onSaved: (val) => password = val,
            validator: (val) {
              if (val == null || val.trim().isEmpty) {
                return 'الرجاء إدخال كلمة المرور';
              } else if (val.trim().length < 8) {
                return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
              }
              return null;
            },
            maxLines: 1,
            hint: 'Password',
            label: 'كلمة المرور',
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                _obscurePassword
                    ? Assets.iconsEyeClosed
                    : Assets.iconsEyeOpened,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.graySwatch[500]!,
                  BlendMode.srcATop,
                ),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          const SizedBox(height: AppSpacing.s8),
          Align(
            alignment: AlignmentDirectional(-1, 0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "نسيت كلمة المرور؟",
                style: TextStyle(color: AppColors.primarySwatch),
              ),
            ),
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
          const SizedBox(height: AppSpacing.s16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ليس لديك حساب؟",
                style: AppStyles.fontsRegular14(
                  context,
                ).copyWith(color: AppColors.bodyTextColor),
              ),
              SizedBox(width: AppSpacing.s4),
              CustomTextButton(
                onPressed: () {},
                title: 'أنشئ حساب جديد',
                textStyle: AppStyles.fontsBold14(
                  context,
                ).copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
