import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/register_cubit/register_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/have_and_dont_have_account.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Sign%20Up/check_box_statement.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? email;
  String? password;
  bool? _isCheck = false;
  bool? _isError = false;
  // ignore: unused_field
  AuthRequestModel? _authModel;
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPassFocus = FocusNode();

  void _submit() async{
    if (_formKey.currentState!.validate() && _isCheck!) {
      _formKey.currentState!.save();
      _authModel = AuthRequestModel(email: email!, password: password!);
      await BlocProvider.of<RegisterCubit>(context).register(_authModel!);
    } else {
      setState(() {
        _isError = true;
        _isAutoValidate = AutovalidateMode.always;
      });
    }
  }

  @override
  void dispose() {
    _confirmPassFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
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
            hint: 'Email',
            label: 'البريد الإلكتروني',
            keyboardType: TextInputType.emailAddress,
            onSaved: (val) => email = val,
            validator: Validation.validateEmail,
            focusNode: _emailFocus,
            textInputAction: TextInputAction.next,
            onEditingComplete:
                () => FocusScope.of(context).requestFocus(_passwordFocus),
          ),
          const SizedBox(height: AppSpacing.s16),
          CustomTextFieldWithLabel(
            onSaved: (val) => password = val,
            onChanged: (val) => password = val,
            validator: Validation.validatePasswordComplex,
            maxLines: 1,
            hint: 'Password',
            label: 'كلمة المرور',
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
                () => FocusScope.of(context).requestFocus(_confirmPassFocus),
          ),
          const SizedBox(height: AppSpacing.s16),
          CustomTextFieldWithLabel(
            validator:
                (val) => Validation.validateConfirmPassword(val, password),
            maxLines: 1,
            hint: 'Password',
            label: 'تأكيد كلمة المرور',
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
            focusNode: _confirmPassFocus,
            textInputAction: TextInputAction.done,
            onEditingComplete: () => FocusScope.of(context).unfocus(),
          ),
          const SizedBox(height: AppSpacing.s16),
          CheckBoxStatement(
            isError: _isError!,
            isCheck: _isCheck!,
            satement: 'أوافق على سياسة الخصوصية و شروط الاستخدام',
            onChanged:
                (value) => setState(() {
                  _isCheck = value;
                }),
          ),
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
