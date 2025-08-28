import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    this.backGroundColor,
    this.boxShadow,
    this.maintainState = false,
    required this.title,
    required this.icon,
    required this.children,
    this.expansionKey,
    this.onExpansionChanged,
    this.initiallyExpanded,
    this.titleTextStyle,
    this.borderSide,  this.iconSize=24,
  });
  final Color? backGroundColor;
  final BoxShadow? boxShadow;
  final bool maintainState;
  final String title;
  final String icon;
  final List<Widget> children;
  final Key? expansionKey;
  final void Function(bool)? onExpansionChanged;
  final bool? initiallyExpanded;
  final TextStyle? titleTextStyle;
  final Color? borderSide;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: backGroundColor ?? AppColors.graySwatch[50]!,
        borderRadius: BorderRadius.circular(16),
        boxShadow: boxShadow != null ? [boxShadow!] : [],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: expansionKey,
          onExpansionChanged: onExpansionChanged,
          initiallyExpanded: initiallyExpanded ?? false,

          collapsedShape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderSide ?? Colors.transparent),
          ),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderSide ?? AppColors.primary),
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          maintainState: maintainState,
          title: Text(
            title,
            style:
                titleTextStyle ??
                AppStyles.fontsBold14(
                  context,
                ).copyWith(color: AppColors.titleTextColor),
          ),
          leading: SvgPicture.asset(
            icon,
            width: iconSize,
            height: iconSize,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcATop),
          ),
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.primary,
          children: children,
        ),
      ),
    );
  }
}
