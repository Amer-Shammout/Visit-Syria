import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/have_and_dont_have_account.dart';

class ForgetPasswordForm1 extends StatefulWidget {
  const ForgetPasswordForm1({super.key});

  @override
  State<ForgetPasswordForm1> createState() => _ForgetPasswordForm1State();
}

class _ForgetPasswordForm1State extends State<ForgetPasswordForm1> {
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? email;
  
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
     
      GoRouter.of(context).pushNamed(AppRouter.kForgetPassword2Name);

      // TODO
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
            hint: 'example@gmail.com',
            label: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            onSaved: (val) => email = val,
            validator: Validation.validateEmail,
          ),
          
          const SizedBox(height: AppSpacing.s8),
         
          const SizedBox(height: AppSpacing.s16),
          CustomButton(
            onPressed: _submit,
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            title: 'التالي',
            textStyle: AppStyles.fontsBold16(
              context,
            ).copyWith(color: AppColors.whiteColor),
            borderRadius: 16,
            verPadding: 16,
            width: double.infinity,
          ),
          const SizedBox(height: AppSpacing.s16),
           HaveandDontHaveAccount(
            actionStatement: 'سجّل دخول',
            statement: 'لديك حساب؟',
            onPressed:
                () => GoRouter.of(
                  context,
                ).pushReplacementNamed(AppRouter.kLoginName),
          ),
        ],
      ),
    );
  }
}