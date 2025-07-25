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
import 'package:visit_syria/Features/Auth/Presentation/Manager/login_cubit/login_cubit.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Common/have_and_dont_have_account.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  // ignore: unused_field
  AuthRequestModel? _authModel;
  String? email, password;
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _authModel = AuthRequestModel(email: email!, password: password!);
      await BlocProvider.of<LoginCubit>(context).login(_authModel!);
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
      });
    }
  }

  @override
  void dispose() {
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
            hint: 'example@gmail.com',
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
            enableInteractiveSelection: false,
            onSaved: (val) => password = val,
            validator: Validation.validatePasswordComplex,
            maxLines: 1,
            hint: '1@aAaaaa',
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
              onPressed: eyeToggle,
            ),
            focusNode: _passwordFocus,
            textInputAction: TextInputAction.done,
            onEditingComplete: () => FocusScope.of(context).unfocus(),
          ),
          const SizedBox(height: AppSpacing.s4),
          Align(
            alignment: AlignmentDirectional(-1, 0),
            child: TextButton(
              onPressed:
                  () => GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRouter.kForgetPassword1Name),
              child: Text(
                "نسيت كلمة المرور؟",
                style: AppStyles.fontsBold14(
                  context,
                ).copyWith(color: AppColors.primary),
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
          HaveandDontHaveAccount(
            actionStatement: 'أنشئ حساب جديد',
            statement: 'ليس لديك حساب؟',
            onPressed:
                () => GoRouter.of(
                  context,
                ).pushReplacementNamed(AppRouter.kSignupName),
          ),
        ],
      ),
    );
  }

  void eyeToggle() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
}
