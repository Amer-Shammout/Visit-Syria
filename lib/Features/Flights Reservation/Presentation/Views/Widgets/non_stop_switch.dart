import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_switch.dart';

class NonStopSwitch extends StatelessWidget {
  const NonStopSwitch({super.key, required this.nonStop, this.onChanged});

  final bool? nonStop;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSwitch(nonStop: nonStop, onChanged: onChanged),
        SizedBox(width: AppSpacing.s8),
        Text("رحلات مباشرة فقط"),
      ],
    );
  }
}
