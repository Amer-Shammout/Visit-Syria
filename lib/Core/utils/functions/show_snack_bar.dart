import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

void showSuccessSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: AppColors.primary,
      backgroundColor: AppColors.graySwatch[100],
      padding: EdgeInsets.zero,
      content: IntrinsicHeight(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 60),
          child: Row(
            children: [
              Container(width: 6, color: AppColors.primary),
              const SizedBox(width: 8),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  textAlign: TextAlign.start,
                  message,
                  style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void showFailureSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      showCloseIcon: true,
      closeIconColor: AppColors.titleTextColor,
      backgroundColor: AppColors.graySwatch[100],
      padding: EdgeInsets.zero,
      content: IntrinsicHeight(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 60),
          child: Row(
            children: [
              Container(width: 6, color: AppColors.red),
              const SizedBox(width: 8),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.cancel_outlined,
                  color: AppColors.red,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  textAlign: TextAlign.start,
                  message,
                  style: TextStyle(
                    color: AppColors.titleTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void showWaitSnackBar(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      showCloseIcon: true,
      closeIconColor: AppColors.primary,
      backgroundColor: AppColors.graySwatch[100],
      padding: EdgeInsets.zero,
      content: IntrinsicHeight(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 60),
          child: Row(
            children: [
              Container(width: 6, color: AppColors.gold),
              const SizedBox(width: 8),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(Icons.timer, color: AppColors.gold, size: 24),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  textAlign: TextAlign.start,
                  "الرجاء الانتظار قليلاً...",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

showTopSnackBar(String title, String message, BuildContext context) {
  DelightToastBar(
    position: DelightSnackbarPosition.top,
    animationCurve: Curves.easeIn,
    animationDuration: Duration(milliseconds: 300),
    autoDismiss: true,
    snackbarDuration: Duration(seconds: 2),
    builder:
        (context) => ToastCard(
          color: AppColors.whiteColor,
          shadowColor: AppColors.titleTextColor.withValues(alpha: .2),
          title: Text(
            title,
            style: AppStyles.fontsBold16(
              context,
            ).copyWith(color: AppColors.titleTextColor),
          ),
          leading: SvgPicture.asset(
            Assets.iconsLogoIcon,
            width: 40,
            height: 40,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.close, size: 20),
            color: Colors.grey,
            onPressed: () {
              DelightToastBar.removeAll();
            },
          ),
          subtitle: Text(
            message,
            style: AppStyles.fontsRegular14(
              context,
            ).copyWith(color: AppColors.bodyTextColor),
          ),
        ),
  ).show(context);
}
