import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:visit_syria/Core/services/google_sign_in.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_text_button.dart';
import 'package:visit_syria/Features/Auth/Presentation/Manager/google_sign_in_cubit/google_sign_in_cubit.dart';

class OrButtons extends StatelessWidget {
  const OrButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          shadow: null,
          onPressed: () async {
            // await GoogleSignIn().signOut();
            BlocProvider.of<GoogleSignInCubit>(context).signInWithGoogle();
          },
          title: 'تسجيل الدخول عبر غوغل',
          textStyle: AppStyles.fontsBold14(
            context,
          ).copyWith(color: AppColors.primary),
          borderRadius: 16,
          fillColor: Colors.transparent,
          strokeColor: AppColors.primary,
          verPadding: 16,
          icon: Assets.iconsGoogleIcon,
        ),
        const SizedBox(height: AppSpacing.s8),
        CustomTextButtonWithIcon(
          title: 'تسجيل الدخول كضيف',
          icon: Assets.iconsUser,
          style: AppStyles.fontsRegular14(context),
          color: AppColors.graySwatch[700]!,
          onPressed: () => GoRouter.of(context).goNamed(AppRouter.kAppRootName),
          size: 16,
        ),
      ],
    );
  }
}
