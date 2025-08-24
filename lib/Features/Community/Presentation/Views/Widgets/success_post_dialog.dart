import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_dialog.dart';

class SuccessPostDialog extends StatelessWidget {
  const SuccessPostDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      useHeader: true,
      title: "تم نشر منشورك بنجاح ",
      icon: Assets.illustrationsSuccessCircle,
      child: Column(
        children: [
          Text(
            "شكراً لمشاركتك! لقد تم استلام منشورك بنجاح، وهو الآن قيد المراجعة.\n\n"
            "يمكنك متابعة حالة منشورك في قسم \"منشوراتي\"، حيث ستظهر إحدى الحالات التالية:\n\n"
            "• بانتظار المراجعة\n"
            "• تم القبول\n"
            "• تم الرفض",
          ),
          SizedBox(height: AppSpacing.s20),
          CustomButton(
            onPressed: () {
              GoRouter.of(context).goNamed(AppRouter.kAppRootName);
            },
            title: "العودة للصفحة الرئيسية",
            textStyle: AppStyles.fontsBold14(
              context,
            ).copyWith(color: AppColors.whiteColor),
            borderRadius: 16,
            verPadding: 12,
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            size: 16,
          ),
        ],
      ),
    );
  }
}
