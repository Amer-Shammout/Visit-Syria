import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Core/widgets/custom_text_field_with_label.dart';
import 'package:visit_syria/Features/Profile/Data/Models/change_password_model.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/change_password_cubit/change_password_cubit.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true, title: "تغيير كلمة المرور"),
      body: ChangePasswordBodyConsumer(),
    );
  }
}

class ChangePasswordBodyConsumer extends StatelessWidget {
  const ChangePasswordBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          GoRouter.of(context).pop();
        }
        if (state is ChangePasswordFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ChangePasswordLoading,
          progressIndicator: CustomLoadingIndicator(),
          child: Center(child: ChangePasswordViewBody()),
        );
      },
    );
  }
}

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ChangePasswordForm(),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  bool _obscurePassword1 = true;
  bool _obscurePassword2 = true;
  bool _obscurePassword3 = true;
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? currentPassword;
  String? newPassword;
  String? confirmPassword;
  // ignore: unused_field
  final _currentPasswordFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPassFocus = FocusNode();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ChangePasswordModel changePasswordModel = ChangePasswordModel(
        currentPassword: currentPassword!,
        newPassword: newPassword!,
        confirmNewPassword: confirmPassword!,
      );
      BlocProvider.of<ChangePasswordCubit>(
        context,
      ).changePassword(changePasswordModel);
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
      });
    }
  }

  @override
  void dispose() {
    _confirmPassFocus.dispose();
    _currentPasswordFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _isAutoValidate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFieldWithLabel(
            onSaved: (val) => currentPassword = val,
            onChanged: (val) => currentPassword = val,
            enableInteractiveSelection: false,
            validator: (val) => Validation.validatePasswordComplex(val),
            maxLines: 1,
            hint: '********',
            label: 'كلمة المرور الحالية',
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
            focusNode: _currentPasswordFocus,
            textInputAction: TextInputAction.next,
            onEditingComplete:
                () => FocusScope.of(context).requestFocus(_passwordFocus),
          ),
          const SizedBox(height: AppSpacing.s16),
          CustomTextFieldWithLabel(
            enableInteractiveSelection: false,
            onSaved: (val) => newPassword = val,
            onChanged: (val) => newPassword = val,
            validator: Validation.validatePasswordComplex,
            maxLines: 1,
            hint: '********',
            label: 'كلمة المرور الجديدة',
            helperText:
                "يجب أن تحتوي كلمة المرور على أحرف كبيرة وصغيرة و رموز مميزة",
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
            focusNode: _passwordFocus,
            textInputAction: TextInputAction.next,
            onEditingComplete:
                () => FocusScope.of(context).requestFocus(_confirmPassFocus),
          ),
          const SizedBox(height: AppSpacing.s16),
          CustomTextFieldWithLabel(
            onSaved: (val) => confirmPassword = val,
            onChanged: (val) => confirmPassword = val,
            enableInteractiveSelection: false,
            validator:
                (val) => Validation.validateConfirmPassword(val, newPassword),
            maxLines: 1,
            hint: '********',
            label: 'تأكيد كلمة المرور المرور',
            obscureText: _obscurePassword3,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                _obscurePassword3
                    ? Assets.iconsEyeClosed
                    : Assets.iconsEyeOpened,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.graySwatch[500]!,
                  BlendMode.srcATop,
                ),
              ),
              onPressed: eyeToggle3,
            ),
            focusNode: _confirmPassFocus,
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
          const SizedBox(height: AppSpacing.s16),
          TextButton(
            onPressed:
                () => GoRouter.of(
                  context,
                ).pushNamed(AppRouter.kForgetPassword1Name, extra: true),
            child: Text(
              "نسيت كلمة المرور؟",
              style: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.primary),
            ),
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

  void eyeToggle3() {
    setState(() {
      _obscurePassword3 = !_obscurePassword3;
    });
  }
}
