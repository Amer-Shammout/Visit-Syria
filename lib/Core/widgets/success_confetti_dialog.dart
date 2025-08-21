import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_dialog.dart';

dynamic showConfettiSuccessDialog({
  context,
  title,
  body,
  buttonTitle,
  onPressed,
  confettiController,
}) {
  confettiController.play();
  return showDialog(
    context: context,
    builder: (context) {
      return SuccessDialogContent(
        title: title,
        body: body,
        buttonTitle: buttonTitle,
        onPressed: onPressed,
        confettiController: confettiController,
      );
    },
  );
}

class SuccessDialogContent extends StatefulWidget {
  final String title;
  final String body;
  final String buttonTitle;
  final VoidCallback onPressed;
  final ConfettiController confettiController;

  const SuccessDialogContent({
    super.key,
    required this.title,
    required this.body,
    required this.buttonTitle,
    required this.onPressed,
    required this.confettiController,
  });

  @override
  State<SuccessDialogContent> createState() => _SuccessDialogContentState();
}

class _SuccessDialogContentState extends State<SuccessDialogContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CustomDialog(
          useHeader: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              SvgPicture.asset(Assets.illustrationsSuccessDialog),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppStyles.fontsBold24(
                      context,
                    ).copyWith(color: AppColors.titleTextColor),
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  Text(
                    widget.body,
                    style: AppStyles.fontsRegular14(
                      context,
                    ).copyWith(color: AppColors.bodyTextColor),
                  ),
                  const SizedBox(height: AppSpacing.s20),
                  CustomButton(
                    onPressed: widget.onPressed,
                    title: widget.buttonTitle,
                    textStyle: AppStyles.fontsBold14(
                      context,
                    ).copyWith(color: AppColors.whiteColor),
                    borderRadius: 16,
                    icon: Assets.iconsArrow,
                    iconColor: AppColors.whiteColor,
                    size: 16,
                    verPadding: 12,
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          top: 0,
          child: ConfettiWidget(
            confettiController: widget.confettiController,
            blastDirection: 3.14 / 2, // للأسفل
            emissionFrequency: 0.05,
            numberOfParticles: 30,
            gravity: 0.4,
            shouldLoop: false,
            colors: const [
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.orange,
              Colors.purple,
            ],
          ),
        ),
      ],
    );
  }
}
