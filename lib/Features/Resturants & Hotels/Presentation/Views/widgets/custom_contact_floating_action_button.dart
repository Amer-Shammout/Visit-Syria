import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';

class CustomContactFloatingActionButton extends StatelessWidget {
  const CustomContactFloatingActionButton({
    super.key,
    required this.phone,
    required this.countryCode,
  });

  final String phone, countryCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [Shadows.aiBootContainerShadow],
        color: AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: CustomButton(
              onPressed: () => callNumber("0$phone"),
              title: "اتصل الآن",
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.whiteColor),
              borderRadius: 16,
              verPadding: 12,
              icon: Assets.iconsCall,
              iconColor: AppColors.whiteColor,
              size: 16,
            ),
          ),
          SizedBox(width: AppSpacing.s8),
          Expanded(
            flex: 2,
            child: CustomButton(
              onPressed: () => openWhatsApp(phone, "مرحباً"),
              title: "تواصل واتساب",
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.primary),
              borderRadius: 16,
              verPadding: 12,
              icon: Assets.iconsWhatsup,
              iconColor: AppColors.primary,
              size: 16,
              fillColor: Colors.transparent,
              strokeColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> openWhatsApp(String phone, String message) async {
    final Uri uri = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('لا يمكن فتح واتساب');
    }
  }

  Future<void> callNumber(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    if (!await launchUrl(uri)) {
      throw Exception('لا يمكن إجراء الاتصال');
    }
  }
}
