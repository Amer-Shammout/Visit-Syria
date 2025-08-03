import 'package:flutter/cupertino.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, required this.nonStop, this.onChanged});

  final bool? nonStop;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: nonStop!,
      onChanged: onChanged,

      activeTrackColor: AppColors.primary,
      inactiveTrackColor: AppColors.graySwatch[300],
      inactiveThumbColor: AppColors.whiteColor,
    );
  }
}
